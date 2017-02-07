require 'test_helper'

class ItemTest < ActiveSupport::TestCase
	def setup
		@item = Item.create(title: "Milk", description: "a catron of milk", price: 12.00)
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
		@item.price < 0.00
		assert_not @item.valid?
	end

	test "default picture is used if no picture is provided" do
		item = Item.new(title: "t", description: "d", price: 5.00)
		item.save
		assert_equal item.picture, "default_item_pic.jpg"
	end

	test "provided picture is used insted of default" do
		item = Item.new(title: "t", description: "d", price: 3.00, picture: "my_item.jpg")
		item.save
		assert_equal item.picture, "my_item.jpg"
	end

	test "item belong to at least one category" do
		@item.category = nil
		assert_not @item.valid?
	end
end
