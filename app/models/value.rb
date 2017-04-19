class Value < ApplicationRecord
  validates :name, presence: true
  validates :optin_id, presence: true
  belongs_to :option
end
