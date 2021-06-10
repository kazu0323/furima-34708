class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  def index
  @items = Item.all.order(id: "DESC")
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
  @item = Item.find(params[:id])
end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :price, :day_id, :category_name_id, :freight_money_id, :states_id, :area_id).merge(user_id: current_user.id)
  end
end
