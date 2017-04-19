class Value < ApplicationRecord
  validates :name, presence: true
  validates :additional_charge, numericality: { greater_than: -1 }
  belongs_to :option
end
