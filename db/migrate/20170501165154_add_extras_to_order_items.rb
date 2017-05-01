class AddExtrasToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :extras, :text, array: true, default: []
  end
end
