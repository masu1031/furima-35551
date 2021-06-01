class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :Items
  has_many :orders

  validates :nickname, :lastname, :firstname, :lastkana, :firstkana, :birthday, presence: true
  validates :lastname, :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :lastkana, :firstkana, format: { with: /\A[ァ-ヶー－]+\z/ }

  validates :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/ }
end
