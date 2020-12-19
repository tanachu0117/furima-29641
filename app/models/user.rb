class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true
  validates :birthday, presence: true

  with_options presence: true do
  validates :password, length: {minimum: 6}
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_paseudnym_readeing, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ }
  validates :last_name_paseudnym_readeing, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ }
  end
end
