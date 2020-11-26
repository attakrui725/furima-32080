class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
  @item = Item.new

  end

  def create
  @item = Item.new(item_params)

  if @item.save
    redirect_to index
  else
    render :new
  end

  end

private

def item_params
  params.require(:item).permit(:image,:name, :description, :price,:category_id, :status_id, :delivery_fee_id, :shipment_source_id, :day_to_ship_id)
end


end
