class DeliveriesController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @deliverie = DeliveriePurchase.new
   end 
  
  def create    
    @deliverie = DeliveriePurchase.new(deliverie_params)
    if @deliverie.valid?
      @deliverie.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def deliverie_params
    params.require(:deliverie_purchase).permit(:post_code, :city, :address, :phone_number, :shipping_area_id, :purchase_id )
  end

end