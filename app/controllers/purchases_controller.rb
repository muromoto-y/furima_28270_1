class PurchasesController < ApplicationController
  
  def new
    @item = Item.find(item_path)
  end

end
