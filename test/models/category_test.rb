require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "valid with a name" do
    category = Category.new(name: "Gear")
    assert category.valid?
  end

  test "invalid without a name" do
    category = Category.new(name: nil)
    assert_not category.valid?
    assert_includes category.errors[:name], "can't be blank"
  end

  test "invalid with duplicate name" do
    Category.create!(name: "Gear")
    duplicate = Category.new(name: "Gear")
    assert_not duplicate.valid?
    assert_includes duplicate.errors[:name], "has already been taken"
  end

  test "has many items" do
    category = categories(:clothing)
    assert_includes category.items, items(:tshirt)
  end

  test "destroying category destroys associated items" do
    category = categories(:clothing)
    assert_difference "Item.count", -1 do
      category.destroy
    end
  end
end
