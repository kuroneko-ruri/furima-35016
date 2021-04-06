class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchase

  with_options presence: true do
    validates :nickname
    validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Full-width characters' }
    validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: ' Full-width katakana characters' }
    validates :password, length: { minimum: 6 },
                         format: { with: /\A(?=.*[a-z])(?=.*\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }
    validates :birth_day
  end
end
