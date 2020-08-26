class Purchase < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_one :delivery

  validates :price, presence: true
end
