class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  with_options presence: true do
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください'}
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください'}
  validates :first_name_furigana, format: { with: /\A[ァ-ン]/, message: '全角カタカナを使用してください'}
  validates :last_name_furigana, format: { with: /\A[ァ-ン]/, message: '全角カタカナを使用してください'}
  validates :nickname
  validates :birthday
  validates :password, length: {minimum: 6 },
                       format: { with: VALID_PASSWORD_REGEX},#英語と数字が入っている、どちらも１文字以上ないとダメ
                       confirmation: true
  validates :email, format: { with: VALID_EMAIL_REGEX, }, 
                    uniqueness: true
                    
  end
end
