class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name,            
    validates :explanation,     
    validates :price,           numericality: { only_interger: true }
                                              { greater_than: 299 }
                                              { less_than: 10000000 }
    validates :category,        numericality: { greater_than: 1 }
    validates :status,          numericality: { greater_than: 1 }
    validates :shipping_burden, numericality: { greater_than: 1 }
    validates :shipping_area,   numericality: { greater_than: 1 }
    validates :shipping_days,   numericality: { greater_than: 1 }
  end
end
