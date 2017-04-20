class Order < ApplicationRecord
  validates :subtotal, presence: true
  validates :total, presence: true
  validates :status, presence: true

  enum status: %w[placed processed completed]
end
