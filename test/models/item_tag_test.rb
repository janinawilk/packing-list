require "test_helper"

class ItemTagTest < ActiveSupport::TestCase
  test "valid with item and tag" do
    item_tag = ItemTag.new(item: items(:phone_charger), tag: tags(:winter))
    assert item_tag.valid?
  end

  test "invalid with duplicate item-tag pair" do
    duplicate = ItemTag.new(item: items(:tshirt), tag: tags(:beach))
    assert_not duplicate.valid?
  end
end
