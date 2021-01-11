class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

    def order_params
      params.permit(:postal_code, :prefecture_id, :city, :city_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
    end

end
