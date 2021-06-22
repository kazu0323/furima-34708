class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index 
  def index
    @purchase_information = PurchaseInformation.new
  end

  def create
    @purchase_information = PurchaseInformation.new(order_params)
    if @purchase_information.valid?
      pay_item
      @purchase_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:purchase_information).permit(:postcode, :area_id, :city, :block, :building, :tell_num ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.purchase.present? 
      redirect_to root_path
    end
  end

end