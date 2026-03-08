require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "valid with name and category" do
    item = Item.new(name: "Jacket", category: categories(:clothing))
    assert item.valid?
  end

  test "invalid without a name" do
    item = Item.new(name: nil, category: categories(:clothing))
    assert_not item.valid?
  end

  test "invalid without a category" do
    item = Item.new(name: "Jacket", category: nil)
    assert_not item.valid?
  end

  test "has many tags through item_tags" do
    sunscreen = items(:sunscreen)
    assert_includes sunscreen.tags, tags(:beach)
    assert_includes sunscreen.tags, tags(:hiking)
  end

  test "has many trips through trip_items" do
    tshirt = items(:tshirt)
    assert_includes tshirt.trips, trips(:beach_vacation)
  end

  test "destroying item destroys associated item_tags" do
    sunscreen = items(:sunscreen)
    assert_difference "ItemTag.count", -2 do
      sunscreen.destroy
    end
  end
end
