require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/comment.png')
  end
  describe "商品出品機能" do
    context "商品の出品ができる時" do
    it "全ての項目が入力されていれば登録できる" do
      expect(@item).to be_valid
    end
    it "販売価格は、¥300~¥9,999,999の間のみ保存可能" do
      @item.price = 400
      expect(@item).to be_valid
    end
    it "販売価格は半角数字のみ保存可能" do
      @item.price = 400
      expect(@item).to be_valid
    end
   end
 
   context "商品の出品ができない時" do
    it "商品画像がない場合出品されない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include ("Image can't be blank")
    end
    it "商品価格が299円以下では出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
    end
    it "商品価格が10_000_000円以上では出品できない" do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
    end
    it "販売価格は全角数字は保存不可能" do
      @item.price = "４００"
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price is not a number")
    end
    it "商品名がない場合出品されない" do
      @item.item_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include ("Item name can't be blank")
    end
    it "商品の説明がない場合出品されない" do
      @item.item_info = ""
      @item.valid?
      expect(@item.errors.full_messages).to include ("Item info can't be blank")
    end
    it "カテゴリーの情報がない場合出品されない" do
      @item.category_name_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("Category name must be other than 1")
    end
    it "商品の状態についての情報がない場合出品されない" do
      @item.states_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("States must be other than 1")
    end
    it "配送料の負担についての情報がない場合出品されない" do
      @item.freight_money_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("Freight money must be other than 1")
    end
    it "発送元の地域についての情報がない場合出品されない" do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("Area must be other than 1")
    end
    it "発送までの日数についての情報がない場合出品されない" do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include ("Day must be other than 1")
    end
    it "販売価格についての情報がない場合出品されない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price can't be blank")
    end
  end
 end
end
