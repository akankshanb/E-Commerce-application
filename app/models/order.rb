class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  # entering the line items into the order table
  def self.enter_line_items(user, cart)
    cart.line_items.each do |item|
      # check if the item is a special item
      if Item.find(item.item_id).special
        order_status = 1
      else
        order_status = 0
      end
      Order.create(:status => order_status, :quantity => item.quantity, :price => item.total_price, :user_id => user.id, :item_id => item.item_id, :name => Item.find(item.item_id).name)
    end
  end
end
