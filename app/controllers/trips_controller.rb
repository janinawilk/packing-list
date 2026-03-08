class TripsController < ApplicationController
  def index
    @trips = Trip.all.order(created_at: :desc)
  end
end
