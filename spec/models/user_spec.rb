require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録/ユーザー情報" do

   context "ユーザー新規登録ができる時" do
    it "パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）" do
      @user.password = 'aaaaa1'
      @user.password_confirmation = 'aaaaa1'
      expect(@user).to be_valid
    end
    it "パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）" do
      @user.password = 'aaaaa1'
      @user.password_confirmation = 'aaaaa1'
      expect(@user).to be_valid
    end
    it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
      @user.password = "a000000"
      @user.password_confirmation = "a000000"
      expect(@user).to be_valid
    end
   end

  context "ユーザー新規登録ができない時" do

    it "nicknameが空だと登録できない" do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性であること" do
      user = FactoryBot.create(:user)
      another_user = FactoryBot.build(:user, email: user.email) 
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは、@を含む必要があること" do
      @user.email = 'test.gmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが必須であること" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは、6文字以下だと登録されない" do
      @user.password = 'aaa1'
      @user.password_confirmation = "aaa1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードとパスワード（確認用）は、値が一致しない場合登録できない" do
      @user.password = "a000000"
      @user.password_confirmation = "a1000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードは、半角英字のみでは登録されない" do
      @user.password = 'aaaaaaaa'
      @user.password_confirmation = 'aaaaaaaa'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password は、半角英数字混合での入力が必須")
    end
    it "パスワードは、数字のみでは登録されない" do
      @user.password = '0000000'
      @user.password_confirmation = '0000000'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password は、半角英数字混合での入力が必須")
    end
    it "パスワードは、全角文字が含まれている場合は登録されない" do
      @user.password = 'あaaaaaaa'
      @user.password_confirmation = 'あaaaaaaaa'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password は、半角英数字混合での入力が必須")
    end
   end
 end

  describe "新規登録/本人情報確認" do
    
   context "ユーザー新規登録ができない時" do
    it "last_nameは、バリデーションを満たさない場合は登録されない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は、全角（漢字・ひらがな・カタカナ）での入力が必須", "Last name can't be blank")
    end
    it "first_nameは、バリデーションを満たさない場合は登録されない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は、全角（漢字・ひらがな・カタカナ）での入力が必須", "First name can't be blank")
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は、全角（漢字・ひらがな・カタカナ）での入力が必須")
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は、全角（漢字・ひらがな・カタカナ）での入力が必須")
    end
    it "ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana 全角（カタカナ）での入力が必須")
    end
    it "first_name_kanaは、名字と名前がそれぞれ必須であること" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角（カタカナ）での入力が必須", "First name kana can't be blank")
    end
    it "ユーザー本名のフリガナは全角（漢字・ひらがな・カタカナ）以外が含まれている場合は登録されないこと" do
      @user.last_name_kana = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角（カタカナ）での入力が必須")
    end
    it "ユーザー本名のフリガナは全角（漢字・ひらがな・カタカナ）以外が含まれている場合は登録されないこと" do
      @user.first_name_kana = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角（カタカナ）での入力が必須")
    end
    it "ユーザー本名のフリガナはバリデーションを満たさない場合は登録されない" do
      @user.first_name_kana = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角（カタカナ）での入力が必須")
      end
      it "ユーザー本名のフリガナはバリデーションを満たさない場合は登録されない" do
        @user.last_name_kana = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角（カタカナ）での入力が必須")
        end

    it "生年月日が必須であること" do
      @user.birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
   end
  end

  context "ユーザー新規登録ができる時" do
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.first_name = "太郎"
      expect(@user).to be_valid
    end
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.last_name = "山田"
      expect(@user).to be_valid
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name = "ヤマダ"
      expect(@user).to be_valid
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = "タロウ"
      expect(@user).to be_valid
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.last_name_kana = "ヤマダ"
      expect(@user).to be_valid
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.first_name_kana = "タロウ"
      expect(@user).to be_valid
    end
  end
end