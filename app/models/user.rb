class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は、全角（漢字・ひらがな・カタカナ）での入力が必須" }
  validates :first_name,format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は、全角（漢字・ひらがな・カタカナ）での入力が必須" }
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角（カタカナ）での入力が必須" }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角（カタカナ）での入力が必須" }
  validates :password,format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: "は、半角英数字混合での入力が必須" }

  with_options presence: true do
    validates :last_name_kana
    validates :first_name_kana
    validates :birth
    validates :last_name
    validates :first_name
    validates :name
  end
end
