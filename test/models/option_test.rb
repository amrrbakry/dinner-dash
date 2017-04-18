require 'test_helper'

class OptionTest < ActiveSupport::TestCase
  def setup
    @item = Item.first
    @option = @item.options.build(name: "option1")
  end

  test "option is valid" do
    assert @option.valid?
  end

  test "name is presnet" do
    @option.name = nil
    assert_not @option.valid?
  end
end
