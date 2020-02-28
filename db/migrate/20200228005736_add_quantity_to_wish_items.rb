class AddQuantityToWishItems < ActiveRecord::Migration[6.0]
  def change
    add_column :wish_items, :quantity, :integer, default: 1
  end
end
