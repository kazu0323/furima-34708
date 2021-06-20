class OrdersController < ApplicationController
  before_action :set_item
  def index
    @purchase_information = PurchaseInformation.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_information = PurchaseInformation.new(order_params)
    if @purchase_information.valid?
      @purchase_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:purchase_information).permit(:postcode, :area_id, :city, :block, :building, :tell_num ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
end