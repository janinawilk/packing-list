class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit update destroy]

  def index
    @items = Item.includes(:category, :tags).order(:name)
    @items_by_category = @items.group_by(&:category).sort_by { |cat, _| cat.name }
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: "Item created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: "Item updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: "Item deleted."
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category_id, tag_ids: [])
  end
end
