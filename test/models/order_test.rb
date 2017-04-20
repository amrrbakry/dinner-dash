require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
    @order = Order.new(subtotal: 10.00, tax: 1, total: 11)
  end

  test "order is valid" do
    assert @order.valid?
  end

  test "total is present" do
    @order.total = nil
    assert_not @order.valid?
  end
end
