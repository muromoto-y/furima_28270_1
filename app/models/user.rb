class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   validates :first_name, :last_name, :first_name_furigana, :last_name_furigana, :birthday, :nick_name, :email, :password, presence: true
end
