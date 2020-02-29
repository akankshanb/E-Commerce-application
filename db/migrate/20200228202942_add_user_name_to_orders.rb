class AddUserNameToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :user_name, :string
  end
end
