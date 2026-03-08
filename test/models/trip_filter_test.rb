require "test_helper"

class TripFilterTest < ActiveSupport::TestCase
  test "valid with trip and tag" do
    trip_filter = TripFilter.new(trip: trips(:hiking_trip), tag: tags(:hiking))
    assert trip_filter.valid?
  end

  test "invalid with duplicate trip-tag pair" do
    duplicate = TripFilter.new(trip: trips(:beach_vacation), tag: tags(:beach))
    assert_not duplicate.valid?
  end
end
