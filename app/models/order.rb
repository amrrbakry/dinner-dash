class Order < ApplicationRecord
  before_save :update_subtotal
  has_many :order_items, dependent: :destroy
  belongs_to :user
  default_scope { order(created_at: :desc) }

  def subtotal
    order_items.collect { |oi| oi.valid? ? ((oi.quantity * oi.unit_price) + oi.total_additional_charge) : 0 }.sum
  end

  def cancel
    self[:status] = "canceled" if status == "processing"
  end

  def paypal_url(return_path)
    values = {
      business: "merch@dd.com",
      cmd: "_xclick",
      upload: 1,
      return: "localhost:3000#{return_path}",
      invoice: id,
      amount: subtotal
    }
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
