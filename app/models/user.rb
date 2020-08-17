class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  with_options presence: true do
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_furigana, format: { with: /\A[ァ-ン]/}
  validates :last_name_furigana, format: { with: /\A[ァ-ン]/}
  validates :nickname
  validates :birthday
  validates :password, length: {minimum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/}, confirmation: true
  validates :email, format: { with: VALID_EMAIL_REGEX }
  end
end
