class PurchaseInformation
  include ActiveModel::Model
  attr_accessor :postcode,:city,:block,:building,:tell_num,:area_id ,:user_id,:item_id

  with_options presence: true do
    validates :postcode,format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :tell_num,format: { with: /\A\d{11}\z/ , message: "is invalid. Include hyphen(-)" }
    with_options numericality: { other_than: 1 } do
      validates :area_id
    end
  end

  def save
    Information.create(postcode: postcode, city: city, block: block, building: building, tell_num: tell_num, area_id: area_id)
    Purchase.create(user_id: user_id, item_id: item_id)
  end
end