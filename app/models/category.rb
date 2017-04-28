class Category < ApplicationRecord
  validates :title, presence: true, length: { in: 2..150 }
  validates :description, presence: true, length: { in: 3..400 }
  has_many :category_items
  has_many :items, through: :category_items
end
