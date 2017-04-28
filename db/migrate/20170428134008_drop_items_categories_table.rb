class DropItemsCategoriesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :items_categories
  end
end
