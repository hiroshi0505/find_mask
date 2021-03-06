class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :masks
  has_many :comments

  PASSWORD_REGEX = /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}\z/
  # NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  # FURIGANA_REGEX = /\A[ァ-ヶー－]+\z/

  # do~endの全てのバリデーションに “presence true” を付ける
  with_options presence: true do
    validates :nickname
    validates :password, format: { with: PASSWORD_REGEX }
    # validates :password, format: { with: PASSWORD_REGEX, message: "は英字と数字が混在するようにして下さい"}
  end
end
