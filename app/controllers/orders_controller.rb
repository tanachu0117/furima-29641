class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @user_order = UserOrder.new
  end

  def create
  end


  private


end
