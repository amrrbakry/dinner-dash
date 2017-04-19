class Value < ApplicationRecord
  validates :name, presence: true
  validates :option_id, presence: true
  belongs_to :option
end
