class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :item_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      item.price
    end
  end

  # extras hold the ids of option values selected for the order item
  def total_additional_charge
    sum = 0
    unless extras.empty?
      extras.each do |value_id|
        value_charge = Value.find_by(id: value_id).additional_charge
        sum += value_charge
      end
    end
    sum
  end

  def total_price
    (unit_price * quantity) + total_additional_charge
  end

  private

  def item_present
    errors.add(:item, "is not valid") if item.nil?
  end

  def order_present
    errors.add(:order, "is not a valid order") if order.nil?
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = total_price
  end
end
