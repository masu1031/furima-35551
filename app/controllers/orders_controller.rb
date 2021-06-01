class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :is_ownuser

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.order.present?
  end

  def is_ownuser
    redirect_to root_path if @item.user == current_user
  end

  def order_params
    params.require(:order_address).permit(:price, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone).merge(
      price: @item.price, user_id: current_user.id, token: params[:token], item_id: @item.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
