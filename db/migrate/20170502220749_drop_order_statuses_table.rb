class DropOrderStatusesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :order_statuses, force: :cascade
  end
end
