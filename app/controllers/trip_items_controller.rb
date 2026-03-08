class TripItemsController < ApplicationController
  before_action :set_trip
  before_action :set_trip_item, only: %i[toggle_packed destroy]

  def create
    @trip_item = @trip.trip_items.build(item_id: params[:item_id], added_manually: true)

    if @trip_item.save
      redirect_to @trip, notice: "#{@trip_item.item.name} added."
    else
      redirect_to @trip, alert: "Could not add item."
    end
  end

  def toggle_packed
    @trip_item.update!(is_packed: !@trip_item.is_packed)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @trip }
    end
  end

  def destroy
    @trip_item.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @trip, notice: "Item removed." }
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_trip_item
    @trip_item = @trip.trip_items.find(params[:id])
  end
end
