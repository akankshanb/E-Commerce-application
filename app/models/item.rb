class Item < ApplicationRecord
  belongs_to :user
  # the image relationship
  # has_one_attached :image
  # the reviews relationship
  has_many :reviews, dependent: :destroy
  # subscribing
  has_many :subscribes, dependent: :destroy
  # line items
  has_many :line_items
  has_many :wish_items
  # the orders
  has_many :orders, dependent: :destroy

  # Validations of the fields
  # validating that the cost is non-negative
  validates :cost, numericality: { greater_than_or_equal_to: 0, message: "The cost must be greater than or equal to zero." }
  # validating that the quantity is non-negative integer
  validates :quantity, numericality: { greater_than_or_equal_to: 0, only_integer: true, message: "The quantity must be a non negative integer."}
  # making sure that the cost is updated after creation
  # before_create :update_cost

  # updating the popularity column to be sorted later
  def self.update_popularity
    total_purchases = Item.sum( 'purchases' )
    # iterating through the table
    Item.all.each do |item|
      if total_purchases.zero?
        normalized_purchases = 0
      else
        normalized_purchases = (item.purchases)/(total_purchases)
      end
      if Review.where(item_id: item.id).blank?
        normalized_review = 0.0
      else
        normalized_review = Review.where(item_id: item.id).average(:rating).round(2)/5
      end
      # the popularity metric is 0.6*normalized_review + 0.4*normalized_review
      popularity = (0.6)*(normalized_review) + (0.4)*(normalized_purchases)
      # updating the column of popularity with the calculated popularity metric
      item.update_column('popularity', popularity)
    end
  end

  # updating the Availability column if the quantity is zero
  def self.update_availability
    # getting the values with quantity zero
    no_quantity_items = Item.where(quantity: 0)
    if not no_quantity_items.empty?
      # iterate through all the items
      no_quantity_items.each do |item|
        item.update_column('available', false)
      end
    end
  end

  # updating the cost column of the item which includes the tax of the item
  def self.update_tax(item)
    # the tax bracket [0-100) -> 5%; [100-1000) -> 10%; [1000,.] ->15%
    # getting the cost of the item
    # cost_item = item.cost
      case item.cost
      # first tax bracket
      when 0..99
        # price_item = (cost_item + (cost_item)*(0.05)).round(2)
        item.update_column('tax', 5)
      # second tax bracket
      when 100..999
        # price_item = ((cost_item + (cost_item)*(0.1))).round(2)
        item.update_column('tax', 10)
      # rest of the tax bracket
      else
        # price_item = ((cost_item + (cost_item)*(0.15))).round(2)
        item.update_column('tax', 15)
      end
  end

  # checking for subscribed users
  def self.check_users
    # checking the items with availability
    available_items = Item.where(available: 'true')
    if not available_items.empty?
      # checking if it is there in the Subscribe table
      subscribed_items = Subscribe.where(item_id: available_items.ids)
      if not subscribed_items.empty?
        # taking in a list of subscribed users
        # s_user_list = subscribed_items.pluck(:user_id)
        s_user = User.find(subscribed_items.pluck(:user_id))
        # if it is not empty
        if not s_user.empty?
          # taking in a list of their email ids
          s_user_mail_list = s_user.pluck(:email)
        end
      end
      # taking a list of all the ids of the subscribed items
      subscribed_ids = subscribed_items.pluck(:id)
      # delete the records of which the mails have been sent out already
      Subscribe.destroy(subscribed_ids)
      # returning this
      s_user_mail_list
    end
  end

  # updating the count according to the purchases made
  def self.update_quantity(line_items)
    line_items.each do |item|
      # take the item id
      item_id = item.item_id
      # extract the present quantity
      item_present_quantity = Item.find(item_id).quantity
      # update the quantity by reducing from the present amount
      Item.find(item_id).update_column('quantity', item_present_quantity - item.quantity)
    end
  end
end