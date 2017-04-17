require 'test_helper'

class ItemsCategoryTest < ActiveSupport::TestCase
  def setup
    @item_category = ItemsCategory.new(category_id: categories(:one).id, item_id: items(:one).id)
  end

  test "item category is valid" do
    assert @item_category.valid?
  end

  test "item id is present" do
    @item_category.item_id = nil
    assert_not @item_category.valid?
  end

  test "category_id is present" do
    @item_category.category_id = nil
    assert_not @item_category.valid?
  end
end
