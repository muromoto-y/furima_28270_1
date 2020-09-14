class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_burden
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :status
  belongs_to_active_hash :user


  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name                
    validates :explanation         
    validates :image               
    validates :price,              numericality: { only_interger: true,
                                                   greater_than: 299 ,
                                                   less_than: 10000000 , message: "価格は300円~9,999,999円で設定してください" }
    validates :category_id,        numericality: { greater_than: 1 , message: "カテゴリーを選択してください"}
    validates :status_id,          numericality: { greater_than: 1 , message: "状態を選択してください"}
    validates :shipping_burden_id, numericality: { greater_than: 1 , message: "送料の負担者を選択してください"}
    validates :shipping_area_id,   numericality: { greater_than: 1 , message: "配送元の地域を選択してください"}
    validates :shipping_day_id,   numericality: { greater_than: 1 , message: "発送までの期間を選択してください"}

  end

  def self.search(search)
    if search != ""
      Item.where('explanation LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

end
