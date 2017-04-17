require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.create(title: "Fruits", description: "Fresh fruits")
  end

  test "category is valid" do
    assert @category.valid?
  end

  test "title is present" do
    @category.title = nil
    assert_not @category.valid?
  end

  test "description is present" do
    @category.description = nil
    assert_not @category.valid?
  end

  test "title is shorter than 150 chars" do
    @category.title = "a" * 151
    assert_not @category.valid?
  end

  test "title is longer than 2 chars" do
    @category.title = "a"
    assert_not @category.valid?
  end

  test "description is within 3..400 chars" do
    @category.description = "a" * 401
    assert_not @category.valid?
    @category.description = "aa"
    assert_not @category.valid?
  end
end
