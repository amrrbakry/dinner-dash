require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @category = categories(:one)
    @item = @category.items.create(title: "Milk", description: "a catron of milk", price: 12.00)
  end

  test "item is valid" do
    assert @item.valid?
  end

  test "title is presnet" do
    @item.title = nil
    assert_not @item.valid?
  end

  test "title is unique" do
    item2 = @item.dup
    item2.save
    assert_includes item2.errors, :title
    assert_includes item2.errors[:title], "Title has to be unique"
  end

  test "description is presnet" do
    @item.description = nil
    assert_not @item.valid?
  end

  test "price is present" do
    @item.price = nil
    assert_not @item.valid?
  end

  test "price is greater than zero" do
    @item.price = -2.00
    assert_not @item.valid?
  end

  test "default picture is used if no picture is provided" do
    item = Item.new(title: "t", description: "d", price: 5.00)
    item.save
    assert_equal item.picture.url, "default_item_pic.jpg"
  end

  test "item belong to at least one category" do
    assert_not @item.categories.empty?
  end
end
