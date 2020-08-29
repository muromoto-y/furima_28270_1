class DeliveriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @item = Item.find(params[:item_id])
    @deliverie = DeliveriePurchase.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end 
  
  def create
    @deliverie = DeliveriePurchase.new(deliverie_params)
    if @deliverie.valid?
      pay_item
      @deliverie.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def deliverie_params
    params.require(:deliverie_purchase).permit(:post_code, :city, :address, :phone_number, :shipping_area_id, :building_name).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_7d0696e64fa620e3cf7e2bbd"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,   #商品の値段
      card: deliverie_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end