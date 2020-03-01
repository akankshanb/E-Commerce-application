class RemoveRestrictedFromItems < ActiveRecord::Migration[6.0]
  def change

    remove_column :items, :restricted, :boolean
  end
end
