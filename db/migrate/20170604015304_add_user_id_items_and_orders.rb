class AddUserIdItemsAndOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :user_id, :integer
    add_column :items, :user_id, :integer
  end
end
