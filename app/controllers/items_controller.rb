class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduce, :category_id, :status_id, :burden_id, :prefecture_id, :day_id,
                                 :price, :user).merge(user_id: current_user.id)
  end
end
