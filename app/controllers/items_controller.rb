class ItemsController < ApplicationController
  def index
    @items = Item.includes(:category, :tags).order(:name)
  end
end
