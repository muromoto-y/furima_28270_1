class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases
         
  validates :first_name, :last_name, :first_name_furigana, :last_name_furigana, :birthday, :nickname, presence: true
  validates :password, presence: true, length: {minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i}
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

end
