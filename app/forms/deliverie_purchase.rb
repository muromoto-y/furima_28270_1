class DeliveriePurchase

  include ActiveModel::Model
  attr_accessor :post_code, :city, :address, :phone_number, :prefecture, :building_name

  with_options presence: true do
  validates :post_code,    format:       { with: /\A\d{3}[-]\d{4}\z/}
  validates :city         
  validates :address      
  validates :phone_number, format:       {with: /\A[0-9]{10,11}\z/}
  validates :prefecture,   numericality: { greater_than: 1 , message: "配送先の地域を選択してください"}
  end
  # validates :building_name


  def save
    deliverie = Deliverie.create(post_code: post_code, city: city, address: address, phone_number: phone_number, prefecture: prefecture)
  end

end