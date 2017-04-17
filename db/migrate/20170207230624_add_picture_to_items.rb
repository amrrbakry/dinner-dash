class AddPictureToItems < ActiveRecord::Migration[5.0]
  def change
    add_attachment :items, :picture
  end
end
