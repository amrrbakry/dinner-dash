class AddAdditionalChargeToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :total_additional_charge, :decimal, precision: 8, scale: 2, default: 0.00
  end
end
