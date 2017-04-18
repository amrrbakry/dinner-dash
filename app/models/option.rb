class Option < ApplicationRecord
  validates :name, presence: true
  has_attached_file :picture, styles: { medium: "50x50#" }
  validates_attachment_content_type :picture, content_type: /\Aimage/
  validates_attachment_file_name :picture, matches: [/png\z/, /jpe?g\z/]
  belongs_to :item
end
