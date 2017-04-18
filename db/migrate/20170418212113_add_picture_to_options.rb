class AddPictureToOptions < ActiveRecord::Migration[5.0]
  def change
    add_attachment :options, :picture
  end
end
