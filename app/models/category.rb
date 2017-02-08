class Category < ApplicationRecord
	validates :title, presence: true, length: { in: 2..150 }
end
