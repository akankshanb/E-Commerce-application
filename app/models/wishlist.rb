class Wishlist < ApplicationRecord
    has_many :wish_items, dependent: :destroy
    def add_item(item)
        current_item = wish_items.find_by(item_id: item.id)
        if current_item
            current_item.increment(:quantity)
        else
            current_item = wish_items.build(item_id: item.id)
        end
        current_item
    end

    def total_price
        wish_items.to_a.sum{ |product| product.total_price}
    end

    def wish_count_over_one
        return total_wish_items if total_wish_items > 0
    end

    def total_wish_items
        total = @wishlist.wish_items.map(&:quantity).sum
        return total if total > 0
    end

    def remove_wish_items(item)
        current_item = wish_items.find_by(item_id: item.id)
        if current_item
          current_item.decrement(:quantity)
        end
        current_item
      end
end
  