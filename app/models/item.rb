class Item < ApplicationRecord
	validates :title, 			presence: true, uniqueness: { message: "%{attribute} has to be unique" }
	validates :description, presence: true
	validates :price, 			presence: true, numericality: { greater_than: 0 }

end
