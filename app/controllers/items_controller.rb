class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.all.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to new_user_session_path unless @item.user_id == current_user.id
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)

    if @item.save
      redirect_to root_path
    else
      render :edit

    end
  end

  def destroy
    item = Item.find(params[:id])

    if item.destroy
      redirect_to root_path

    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :category_id, :status_id, :delivery_fee_id, :shipment_source_id, :day_to_ship_id).merge(user_id: current_user.id)
  end
end
