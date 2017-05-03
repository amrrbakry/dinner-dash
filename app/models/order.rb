class Order < ApplicationRecord
  before_save :update_subtotal
  has_many :order_items, dependent: :destroy
  default_scope { order(created_at: :desc) }

  def subtotal
    order_items.collect { |oi| oi.valid? ? ((oi.quantity * oi.unit_price) + oi.total_additional_charge) : 0 }.sum
  end

  def cancel
    self[:status] = "canceled" if status == "processing"
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
