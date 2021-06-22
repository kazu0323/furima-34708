require 'rails_helper'

RSpec.describe PurchaseInformation, type: :model do
  before do
    @info = FactoryBot.build(:purchase_information)
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/comment.png')
    @item.user_id = @user.id
    @item.save
    @info.user_id = @user.id
    @info.item_id = @item.id
    sleep 0.1
  end

  describe "商品購入機能" do
    context "商品の出品ができる時" do
      it "配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること" do
        expect(@info).to be_valid
      end
      it "建物名が抜けていても登録できること" do
        @info.building = ""
        expect(@info).to be_valid
      end
    end
    context "商品の出品ができない時" do
      it "配送先の情報として、郵便番号が必須であること" do
        @info.postcode = ""
        @info.valid?
        expect(@info.errors.full_messages).to include ("Postcode can't be blank")
      end
      it "配送先の情報として、都道府県が必須であること" do
        @info.area_id = ""
        @info.valid?
        expect(@info.errors.full_messages).to include ("Area を選択してください")
      end
      it "配送先の情報として、1以外でないと登録できないこと" do
        @info.area_id = "1"
        @info.valid?
        expect(@info.errors.full_messages).to include ("Area を選択してください")
      end
      it "配送先の情報として、市区町村が必須であること" do
        @info.city = ""
        @info.valid?
        expect(@info.errors.full_messages).to include ("City can't be blank")
      end
      it "配送先の情報として、番地が必須であること" do
        @info.block = ""
        @info.valid?
        expect(@info.errors.full_messages).to include ("Block can't be blank")
      end
      it "配送先の情報として、電話番号が必須であること" do
        @info.tell_num = ""
        @info.valid?
        expect(@info.errors.full_messages).to include ("Tell num can't be blank")
      end
      it "電話番号が英数混合では登録できないこと" do
        @info.tell_num = "0903323se"
        @info.valid?
        expect(@info.errors.full_messages).to include ("Tell num is invalid")
      end
      it "郵便番号の保存にはハイフンが必要であること" do
        @info.postcode = "2540065"
        @info.valid?
        expect(@info.errors.full_messages).to include ("Postcode はハイフンを含めてください")
      end
      it "電話番号は12桁以上の数値では保存不可能" do
        @info.tell_num = "000000000000"
        @info.valid? 
        expect(@info.errors.full_messages).to include ("Tell num is invalid")
      end
      it "tokenが空では登録できないこと" do
        @info.token = nil
        @info.valid?
        expect(@info.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end