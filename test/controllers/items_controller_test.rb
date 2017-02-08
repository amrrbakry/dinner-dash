require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest

	test "default picture is used if no picture is provided" do
		item = Item.new(title: "t", description: "d", price: 5.00)
		item.save
		assert_equal item.picture.url, "default_item_pic.jpg"
	end
end
