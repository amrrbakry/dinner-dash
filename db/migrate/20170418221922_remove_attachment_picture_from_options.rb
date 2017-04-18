class RemoveAttachmentPictureFromOptions < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :options, :picture
  end
end
