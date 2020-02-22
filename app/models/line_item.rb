class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  def total_price
    item.cost.to_i * quantity.to_i
  end

  def remove_items
    current_item = line_items.find_by(item_id: item.id)
    if current_item
      current_item.decrement(:quantity)
    end
    current_item
  end
end