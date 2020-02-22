class AddPopularityToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :popularity, :float
  end
end
