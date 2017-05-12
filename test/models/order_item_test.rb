require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  def setup
    @order = orders(:one)
    @item = items(:one)
    @order_item = @order.order_items.create(item_id: @item.id, unit_price: 7.00, quantity: 1)
  end

  test "order item is valid" do
    assert @order_item.valid?
  end
end
