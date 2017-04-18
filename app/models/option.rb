class Option < ApplicationRecord
  validates :name, presence: true
  has_attached_file :picture, styles: { medium: "50x50#" }
  validates_attachment_content_type :picture, content_type: %r{/\Aimage\/.*\z/}
  belongs_to :item
end
