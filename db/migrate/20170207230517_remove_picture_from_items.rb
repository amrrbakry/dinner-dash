class RemovePictureFromItems < ActiveRecord::Migration[5.0]
  def change
  	remove_column :items, :picture
  end
end
