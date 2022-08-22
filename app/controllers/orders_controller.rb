class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_root_path, only: :index

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path 
    end
  end

  def order_params
    params.require(:order_address).permit(:zipcode,:area_id,:city,:address1,:address2,:phone,:order).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
