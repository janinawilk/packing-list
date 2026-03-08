require "test_helper"

class TripItemTest < ActiveSupport::TestCase
  test "valid with trip and item" do
    trip_item = TripItem.new(trip: trips(:hiking_trip), item: items(:phone_charger))
    assert trip_item.valid?
  end

  test "invalid with duplicate trip-item pair" do
    duplicate = TripItem.new(trip: trips(:beach_vacation), item: items(:tshirt))
    assert_not duplicate.valid?
  end

  test "defaults is_packed to false" do
    trip_item = TripItem.create!(trip: trips(:hiking_trip), item: items(:tshirt))
    assert_equal false, trip_item.is_packed
  end

  test "defaults added_manually to false" do
    trip_item = TripItem.create!(trip: trips(:hiking_trip), item: items(:tshirt))
    assert_equal false, trip_item.added_manually
  end
end
