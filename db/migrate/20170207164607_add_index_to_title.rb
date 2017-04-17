class AddIndexToTitle < ActiveRecord::Migration[5.0]
  def change
    add_index :items, :title
  end
end
