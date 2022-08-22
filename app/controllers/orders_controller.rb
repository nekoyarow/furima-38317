class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_root_path, only: :index

  def index
    
  end

  private
  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path 
    end
  end
end
