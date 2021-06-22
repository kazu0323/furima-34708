class PurchaseInformation
  include ActiveModel::Model
  attr_accessor :postcode,:city,:block,:building,:tell_num,:area_id ,:user_id,:item_id,:purchase_id,:token

  with_options presence: true do
    validates :city
    validates :token
    validates :block
    validates :user_id
    validates :item_id
    validates :postcode,format: {with: /\A\d{3}[-]\d{4}\z/ , message: "はハイフンを含めてください" }
    validates :tell_num,format: { with: /\A\d{10,11}\z/  }
    with_options numericality: { other_than: 1 , message: "を選択してください"} do
      validates :area_id
    end
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Info.create(postcode: postcode, city: city, block: block, building: building, tell_num: tell_num, area_id: area_id, purchase_id: purchase.id)
  end
end