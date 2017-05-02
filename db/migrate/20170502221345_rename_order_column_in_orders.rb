class RenameOrderColumnInOrders < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :order_status_id, :status
  end
end
