class WishItem < ApplicationRecord
  belongs_to :item
  belongs_to :wishlist
  def total_price
    item.cost.to_i * (1 + (item.tax / 100)) * quantity.to_i
  end
end
