class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update destroy]

  def index
    @trips = Trip.includes(:trip_items).order(created_at: :desc)
  end

  def show
    @trips = Trip.includes(:trip_items, :tags).order(created_at: :desc)
    @trip_items_by_category = @trip.trip_items
      .includes(item: [:category, :tags])
      .sort_by { |ti| [ti.item.category.name, ti.is_packed ? 1 : 0, ti.item.name] }
      .group_by { |ti| ti.item.category }
    @available_items = Item.where.not(id: @trip.item_ids).order(:name)
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      populate_items_from_tags(@trip, params[:trip][:tag_ids])
      redirect_to @trip, notice: "Trip created with #{@trip.trip_items.count} items."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: "Trip updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path, notice: "Trip deleted."
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name)
  end

  def populate_items_from_tags(trip, tag_ids)
    tag_ids = Array(tag_ids).reject(&:blank?).map(&:to_i)
    return if tag_ids.empty?

    tag_ids.each do |tag_id|
      trip.trip_filters.find_or_create_by!(tag_id: tag_id)
    end

    items = Item.joins(:item_tags).where(item_tags: { tag_id: tag_ids }).distinct
    items.each do |item|
      trip.trip_items.find_or_create_by!(item: item)
    end
  end
end
