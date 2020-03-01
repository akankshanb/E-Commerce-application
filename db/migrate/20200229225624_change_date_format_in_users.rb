class ChangeDateFormatInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :exp, :string
  end
end
