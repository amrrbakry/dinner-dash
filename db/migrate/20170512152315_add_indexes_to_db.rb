class AddIndexesToDb < ActiveRecord::Migration[5.0]
  def change
    add_index :category_items, :item_id
    add_index :category_items, :category_id
    add_index :items, :parent_item_id
  end
end
