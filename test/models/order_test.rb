require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
    @order = Order.new(subtotal: 10.00, tax: 1, total: 11, status: "placed")
  end

  test "subtotal is present" do
    @order.subtotal = nil
    assert_not @order.valid?
  end

  test "total is present" do
    @order.total = nil
    assert_not @order.valid?
  end

  test "status is present" do
    @order.status = nil
  end

  test "status is either placed, processed or completed" do
    statuses = %w[placed processed completed]
    assert_includes(statuses, @order.status)
  end
end
