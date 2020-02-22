class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_item(item)
    current_item = line_items.find_by(item_id: item.id)
    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.build(item_id: item.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |product| product.total_price }
  end

  def cart_count_over_one
    return total_cart_items if total_cart_items > 0
  end

  def total_cart_items
    total = @cart.line_items.map(&:quantity).sum
    return total if total > 0
  end

  def remove_cart_items(item)
    current_item = line_items.find_by(item_id: item.id)
    if current_item
      current_item.decrement(:quantity)
    end
    current_item
  end

end
