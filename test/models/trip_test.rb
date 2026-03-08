require "test_helper"

class TripTest < ActiveSupport::TestCase
  test "valid with a name" do
    trip = Trip.new(name: "Weekend Getaway")
    assert trip.valid?
  end

  test "invalid without a name" do
    trip = Trip.new(name: nil)
    assert_not trip.valid?
  end

  test "has many items through trip_items" do
    beach = trips(:beach_vacation)
    assert_includes beach.items, items(:tshirt)
    assert_includes beach.items, items(:sunscreen)
  end

  test "has many tags through trip_filters" do
    beach = trips(:beach_vacation)
    assert_includes beach.tags, tags(:beach)
  end

  test "destroying trip destroys associated trip_items and trip_filters" do
    beach = trips(:beach_vacation)
    assert_difference "TripItem.count", -2 do
      assert_difference "TripFilter.count", -1 do
        beach.destroy
      end
    end
  end
end
