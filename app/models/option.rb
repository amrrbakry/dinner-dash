class Option < ApplicationRecord
  validates :name, presence: true
  has_attached_file :o_picture, styles: { medium: "50x50#" }
  validates_attachment_content_type :o_picture, content_type: /\Aimage/
  validates_attachment_file_name :o_picture, matches: [/png\z/, /jpe?g\z/]
  belongs_to :item
end
