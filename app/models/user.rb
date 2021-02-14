class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases
  with_options presence: true do
    validates :nickname
    validates :email,               format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is invalid. Input half-width characters."},
                                    uniqueness: true
    validates :encrypted_password,  format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input half-width characters."},
                                    length: { minimum: 6 }, confirmation: true
    validates :last_name,           format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :first_name,          format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :last_name_kana,      format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :first_name_kana,     format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :birth_day
  end
end
