class ItemsController < ApplicationController
  before_action :move_to_login, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.order(created_at: 'DESC')
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
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :cost_id, :area_id, :shipdate_id,
                                 :price).merge(user_id: current_user.id)
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
    item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
