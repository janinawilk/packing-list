require "test_helper"

class TripItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip = trips(:beach_vacation)
    @trip_item = trip_items(:beach_tshirt)
  end

  test "should add item to trip" do
    assert_difference("TripItem.count") do
      post trip_trip_items_url(@trip), params: { item_id: items(:phone_charger).id }
    end
    assert_redirected_to trip_path(@trip)
    assert TripItem.last.added_manually
  end

  test "should toggle packed status" do
    assert_not @trip_item.is_packed
    patch toggle_packed_trip_trip_item_url(@trip, @trip_item)
    assert @trip_item.reload.is_packed
  end

  test "should toggle packed via turbo stream" do
    patch toggle_packed_trip_trip_item_url(@trip, @trip_item),
          headers: { "Accept" => "text/vnd.turbo-stream.html" }
    assert_response :success
    assert @trip_item.reload.is_packed
  end

  test "should remove item from trip" do
    assert_difference("TripItem.count", -1) do
      delete trip_trip_item_url(@trip, @trip_item)
    end
  end

  test "should remove item via turbo stream" do
    assert_difference("TripItem.count", -1) do
      delete trip_trip_item_url(@trip, @trip_item),
             headers: { "Accept" => "text/vnd.turbo-stream.html" }
    end
    assert_response :success
  end
end
