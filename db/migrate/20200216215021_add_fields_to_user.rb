class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :integer
    add_column :users, :dob, :date
    add_column :users, :address, :string
    add_column :users, :card_name, :string
    add_column :users, :card_number, :string
    add_column :users, :exp, :date
    add_column :users, :cvv, :integer
  end
end
