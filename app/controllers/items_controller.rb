class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_item, except: [:index, :new, :create]
  before_action :move_to_edit, only: [:edit, :update, :destroy]

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

end

def edit

end

def update
  if @item.update(item_params)
    redirect_to item_path(@item)
  else
    render :edit
  end
end

def destroy
  @item.destroy
  redirect_to root_path
end
  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :price, :day_id, :category_name_id, :freight_money_id, :states_id, :area_id).merge(user_id: current_user.id)
  end

  def move_to_edit
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
  def set_item
    @item = Item.find(params[:id])
  end
end
