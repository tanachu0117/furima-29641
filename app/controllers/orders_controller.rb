class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :shipping_user_sold_out_check, only:[:index, :create]

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render :index
    end

  end


  private  

    def set_item
      @item = Item.find(params[:item_id])
    end

    def order_params
      params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :city_number, :building_name, :phone_number ).merge(item_id: params[:item_id], token: params[:token], user_id: current_user.id)
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

    def shipping_user_sold_out_check
      if current_user.id == @item.user_id || @item.order.present?
        redirect_to root_path
      end
    end
    
    end

end

