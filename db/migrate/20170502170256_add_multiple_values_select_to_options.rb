class AddMultipleValuesSelectToOptions < ActiveRecord::Migration[5.0]
  def change
    add_column :options, :multiple_values, :boolean, default: false
  end
end
