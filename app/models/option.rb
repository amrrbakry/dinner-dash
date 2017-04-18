class Option < ApplicationRecord
  validates :name, presence: true
  has_attached_file :o_picture, styles: { medium: "120x120#" }
  validates_attachment_content_type :o_picture, content_type: /\Aimage/
  validates_attachment_file_name :o_picture, matches: [/png\z/, /jpe?g\z/]
  validates_attachment_size :o_picture, less_than: 2.megabytes
  belongs_to :item
end
