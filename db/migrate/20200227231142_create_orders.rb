class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :status
      t.integer :quantity
      t.integer :price
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
