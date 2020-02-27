class AddTaxToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :tax, :float
  end
end
