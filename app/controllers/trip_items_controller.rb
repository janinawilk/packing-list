class TripItemsController < ApplicationController
  before_action :set_trip
  before_action :set_trip_item, only: %i[toggle_packed destroy]

  def create
    @trip_item = @trip.trip_items.build(item_id: params[:item_id], added_manually: true)

    if @trip_item.save
      broadcast_full_trip_update
      redirect_to @trip, notice: "#{@trip_item.item.name} added."
    else
      redirect_to @trip, alert: "Could not add item."
    end
  end

  def toggle_packed
    @trip_item.update!(is_packed: !@trip_item.is_packed)

    @category = @trip_item.item.category
    @category_items = @trip.trip_items
      .includes(item: [:category, :tags])
      .select { |ti| ti.item.category_id == @category.id }

    broadcast_toggle_update

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @trip }
    end
  end

  def destroy
    @trip_item.destroy

    broadcast_full_trip_update

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

  def broadcast_toggle_update
    Turbo::StreamsChannel.broadcast_replace_to(
      @trip,
      target: "category-#{@category.id}",
      partial: "trips/category_card",
      locals: { category: @category, trip_items: @category_items }
    )
    Turbo::StreamsChannel.broadcast_replace_to(
      @trip,
      target: "trip-progress",
      partial: "trips/progress",
      locals: { trip: @trip }
    )
  end

  def broadcast_full_trip_update
    trip_items_by_category = @trip.trip_items.reload
      .includes(item: [:category, :tags])
      .sort_by { |ti| [ti.item.category.name, ti.is_packed ? 1 : 0, ti.item.name] }
      .group_by { |ti| ti.item.category }

    Turbo::StreamsChannel.broadcast_replace_to(
      @trip,
      target: "trip-items",
      partial: "trips/trip_items_list",
      locals: { trip: @trip, trip_items_by_category: trip_items_by_category }
    )
    Turbo::StreamsChannel.broadcast_replace_to(
      @trip,
      target: "trip-progress",
      partial: "trips/progress",
      locals: { trip: @trip }
    )
    Turbo::StreamsChannel.broadcast_replace_to(
      @trip,
      target: "add-item-form",
      partial: "trips/add_item_form",
      locals: { trip: @trip, available_items: Item.where.not(id: @trip.item_ids).order(:name) }
    )
  end
end
