class CreateWishItems < ActiveRecord::Migration[6.0]
  def change
    create_table :wish_items do |t|
      t.references :item, foreign_key: true
      t.belongs_to :wishlist, foreign_key: true

      t.timestamps
    end
  end
end
