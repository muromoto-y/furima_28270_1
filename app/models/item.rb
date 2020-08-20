class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name                
    validates :explanation         
    validates :image               
    validates :price,              numericality: { only_interger: true,
                                                   greater_than: 299,
                                                   less_than: 10000000 }
    validates :category_id,        numericality: { greater_than: 1 }
    validates :status_id,          numericality: { greater_than: 1 }
    validates :shipping_burden_id, numericality: { greater_than: 1 }
    validates :shipping_area_id,   numericality: { greater_than: 1 }
    validates :shipping_days_id,   numericality: { greater_than: 1 }

  end
end
