class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    redirect_to root_path if @item.order.present?
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(user_purchase_params)
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def user_purchase_params
    params.require(:user_purchase).permit(:postal_code, :prefecture, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    if @item.user_id == current_user.id
        redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: user_purchase_params[:token],    # カードトークン
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])

  end
end
