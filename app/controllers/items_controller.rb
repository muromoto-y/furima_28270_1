class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action　@item = Item.find(params[:id])

  def index
    @items = Item.all.order("created_at DESC")
    
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
    if current_user.id != @item.user_id
       redirect_to item_path(@item.id)
    end
  end

  def update
    if
      @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :status_id, :shipping_burden_id, :shipping_area_id, :shipping_day_id, ).merge(user_id: current_user.id)
  end
end


