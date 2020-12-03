class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @user_purchase = UserPurchase.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?
    redirect_to root_path if @item.user_id == current_user.id
  end

  def create
    @user_purchase = UserPurchase.new(user_purchase_params)
    @item = Item.find(params[:item_id])
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

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: user_purchase_params[:token],    # カードトークン
      currency: 'jpy'
    )
  end
end
