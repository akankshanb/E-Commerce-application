class Item < ApplicationRecord
  # the image relationship
  has_one_attached :image
  # the reviews relationship
  has_many :reviews, dependent: :destroy

  # updating the popularity column to be sorted later
  def self.update_popularity
    total_purchases = Item.sum("purchases")
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

  # implementing the search
  def self.search(search, search_from)
    Item.where(search_from.downcase => search)
  end
end
