class AddRequiredToOptions < ActiveRecord::Migration[5.0]
  def change
    add_column :options, :required, :boolean, default: false
  end
end
