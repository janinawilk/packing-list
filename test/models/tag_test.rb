require "test_helper"

class TagTest < ActiveSupport::TestCase
  test "valid with a name" do
    tag = Tag.new(name: "Formal")
    assert tag.valid?
  end

  test "invalid without a name" do
    tag = Tag.new(name: nil)
    assert_not tag.valid?
  end

  test "invalid with duplicate name" do
    Tag.create!(name: "Formal")
    duplicate = Tag.new(name: "Formal")
    assert_not duplicate.valid?
  end

  test "has many items through item_tags" do
    beach = tags(:beach)
    assert_includes beach.items, items(:tshirt)
    assert_includes beach.items, items(:sunscreen)
  end
end
