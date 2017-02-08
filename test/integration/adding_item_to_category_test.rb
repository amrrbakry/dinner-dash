require 'test_helper'

class AddingItemToCategoryTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers

	def setup
		@user = User.first
	end
end
