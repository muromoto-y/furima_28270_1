class DeliveriesController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @deliverie = DeliveriePurchase.new
   end 
  
  def create    
    @deliverie = DeliveriePurchase.new(deliverie_params)
    @deliverie.save
  end

  private

  def deliverie_params
    params.require(:deliverie_purchase).permit(:post_code, :city, :address, :phone_number, :prefecture)
  end

end