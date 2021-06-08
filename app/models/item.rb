class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  private


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_name
  belongs_to :states
  belongs_to :freight_money
  belongs_to :area
  belongs_to :day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    validates :price, numericality: { greater_than_or_equal_to: 300,
      less_than: 9999999 }
    with_options numericality: { other_than: 1 } do
      validates :states_id
      validates :category_name_id
      validates :freight_money_id
      validates :area_id
      validates :day_id
    end
  end
end