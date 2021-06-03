class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :last_name, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は、全角（漢字・ひらがな・カタカナ）での入力が必須" }
  validates :first_name, presence: true,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は、全角（漢字・ひらがな・カタカナ）での入力が必須" }
  validates :last_name_kana, presence: true,format: { with: /\A[ァ-ヶー－]+\z/, message: "全角（カタカナ）での入力が必須" }
  validates :first_name_kana, presence: true,format: { with: /\A[ァ-ヶー－]+\z/, message: "全角（カタカナ）での入力が必須" }
  validates :birth, presence: true
  validates :encrypted_password,format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/, message: "は、半角英数字混合での入力が必須" }

end
