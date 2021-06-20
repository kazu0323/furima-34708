require 'rails_helper'

RSpec.describe Info, type: :model do
  before do
    @info = FactoryBot.build(:info)
  end
  describe "商品購入機能" do
    context "商品の出品ができる時" do
      it "配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること" do
        expect(@info).to be_valid
      end
      it "電話番号は11桁以内の数値のみ保存可能" do
      end
    end
    context "商品の出品ができない時" do
      it "配送先の情報として、郵便番号が必須であること" do
        @info.postcode = ""
        @info.valid?
        binding.pry
      end
      it "配送先の情報として、都道府県が必須であること" do
      end
      it "配送先の情報として、市区町村が必須であること" do
      end
      it "配送先の情報として、番地が必須であること" do
      end
      it "配送先の情報として、電話番号が必須であること" do
      end
      it "郵便番号の保存にはハイフンが必要であること" do
        @info.postcode = 3333333
        @info.valid?
        binding.pry
        expect(@info.errors.full_messages).to include ("Image can't be blank")
      end
      it "電話番号は11桁以内の数値のみ保存可能" do
      end
    end
  end
end