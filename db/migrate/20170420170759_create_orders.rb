class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 8, scale: 2
      t.decimal :tax, precision: 8, scale: 2
      t.decimal :total, precision: 8, scale: 2
      t.string :status

      t.timestamps
    end
  end
end
