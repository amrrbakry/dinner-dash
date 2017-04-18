class AddAttachmentOpictureToOptions < ActiveRecord::Migration[5.0]
  def change
    add_attachment :options, :o_picture
  end
end
