class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  # entering the line items into the order table
  def self.enter_line_items(user, cart)
    # WE MIGHT NEED ITEM NAME AS WELL!!!
    cart.line_items.each do |item|
      Order.create(:status => 0, :quantity => item.quantity, :price => item.total_price, :user_id => user.id, :item_id => item.item_id)
    end
  end
end
