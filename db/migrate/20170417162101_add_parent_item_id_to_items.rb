class AddParentItemIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :parent_item_id, :integer
  end
end
