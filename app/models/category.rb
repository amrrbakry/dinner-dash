class Category < ApplicationRecord
  validates :title, presence: true, length: { in: 2..150 }
  validates :description, presence: true, length: { in: 3..400 }

  has_many :items_categories
  has_many :items, through: :items_categories
end
