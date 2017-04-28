class RenameItemIdInOptions < ActiveRecord::Migration[5.0]
  def change
    rename_column :options, :order_item_id, :item_id
  end
end
