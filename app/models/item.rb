class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates
    validates
  end
end
