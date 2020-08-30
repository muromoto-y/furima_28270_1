class DeliveriePurchase

  include ActiveModel::Model
  attr_accessor :post_code, :city, :address, :phone_number, :shipping_area_id, :building_name, :user_id, :item_id, :token

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  PHONE_NUMBER_REGEX = 

  with_options presence: true do
    validates :post_code,        format:       { with: POSTAL_CODE_REGEX}
    validates :city              
    validates :address           
    validates :phone_number,     format:       {with: /\A\d{10,11}\z/}
                                 length:       { maximum: 11, message: 'Too long' }
    validates :shipping_area_id, numericality: { greater_than: 1 , message: "配送先の地域を選択してください"}
    validates :token
    validates :user_id
    validates :item_id
  end


  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    deliverie = Deliverie.create(post_code: post_code, city: city, address: address, phone_number: phone_number, shipping_area_id: shipping_area_id, purchase_id: purchase.id)
  end

end