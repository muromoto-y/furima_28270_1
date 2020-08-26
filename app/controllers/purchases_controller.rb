class PurchasesController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    Purchase.new
   end 
  
  private
  def purchase_params
    params.require(:purchase).permit(:text).marge(user_id: current_user.id, item_id: params[:item_id])
  end
end