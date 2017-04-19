class CreateValues < ActiveRecord::Migration[5.0]
  def change
    create_table :values do |t|
      t.string :name
      t.decimal :addtional_charge, precision: 8, scale: 2, default: 0.00, null: false
      t.references :option, foreign_key: true

      t.timestamps
    end
  end
end
