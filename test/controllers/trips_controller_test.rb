require "test_helper"

class TripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip = trips(:beach_vacation)
  end

  test "should get index" do
    get trips_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_url
    assert_response :success
  end

  test "should create trip" do
    assert_difference("Trip.count") do
      post trips_url, params: { trip: { name: "Ski Trip", tag_ids: [] } }
    end
    assert_redirected_to trip_path(Trip.last)
  end

  test "should create trip and populate items from tags" do
    assert_difference("Trip.count") do
      post trips_url, params: { trip: { name: "Beach Trip", tag_ids: [tags(:beach).id] } }
    end
    trip = Trip.last
    assert trip.trip_items.count > 0
    assert_includes trip.tags, tags(:beach)
  end

  test "should not create invalid trip" do
    assert_no_difference("Trip.count") do
      post trips_url, params: { trip: { name: "" } }
    end
    assert_response :unprocessable_entity
  end

  test "should show trip" do
    get trip_url(@trip)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_url(@trip)
    assert_response :success
  end

  test "should update trip" do
    patch trip_url(@trip), params: { trip: { name: "Updated" } }
    assert_redirected_to trip_path(@trip)
    assert_equal "Updated", @trip.reload.name
  end

  test "should destroy trip" do
    assert_difference("Trip.count", -1) do
      delete trip_url(@trip)
    end
    assert_redirected_to trips_path
  end
end
