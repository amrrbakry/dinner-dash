class Value < ApplicationRecord
  validates :name, presence: true
  validates :option_id, presence: true
  validates :additional_charge, numericality: { greater_than: -1 }
  belongs_to :option
end
