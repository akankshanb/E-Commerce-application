class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :brand
      t.string :name
      t.string :category
      t.integer :quantity
      t.float :cost
      t.integer :purchases
      t.boolean :available
      t.boolean :special
      t.boolean :restricted
      t.boolean :age_restricted
      t.string :image

      t.timestamps
    end
  end
end
