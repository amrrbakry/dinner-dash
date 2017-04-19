class AddDescriptionToOptions < ActiveRecord::Migration[5.0]
  def change
    add_column :options, :description, :text
  end
end
