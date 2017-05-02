class Order < ApplicationRecord
  before_save :update_subtotal
  has_many :order_items, dependent: :destroy
  belongs_to :order_status

  def subtotal
    order_items.collect { |oi| oi.valid? ? ((oi.quantity * oi.unit_price) + oi.total_additional_charge) : 0 }.sum
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
