class Item < ApplicationRecord
  validates :title, presence: true, uniqueness: { message: "%{attribute} has to be unique" }
  validates :description, presence: true
  validates :price,  presence: true, numericality: { greater_than: 0 }

  has_attached_file :picture, styles: { medium: "50x50#" }, default_url: "default_item_pic.jpg"
  validates_attachment_content_type :picture, content_type: %r{/\Aimage\/.*\z/}

  has_many :items_categories
  has_many :categories, through: :items_categories

  searchkick
end
