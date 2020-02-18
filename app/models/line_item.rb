class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  def total_price
    item.cost.to_i * quantity.to_i
  end
end
