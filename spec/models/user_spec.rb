require 'rails_helper'
RSpec.describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birth_day、が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが入力されていれば登録できる" do
        @user.nickname = "test"
        expect(@user).to be_valid
      end

      it "emailが入力されていれば登録できる" do
        @user.email = "test@test"
        expect(@user).to be_valid
      end

      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = "000000"
        expect(@user).to be_valid
      end

      it "last_nameが入力されていれば登録できる（日本語のみ）" do
        @user.last_name = "山田"
        expect(@user).to be_valid
      end

      it "first_nameが入力されていれば登録できる（日本語のみ）" do
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end

      it "last_name_kanaが入力されていれば登録できる（カタカナのみ）" do
        @user.last_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end

      it "first_name_kanaが入力されていれば登録できる（カタカナのみ）" do
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end

      it "birth_dayが入力されていれば登録できる" do
        @user.birth_day = "2000-01-01"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_name(日本語のみ)が空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it "first_name(日本語のみ)が空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "last_name_kana(カタカナのみ)が空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
      end
      it "first_name_kana(カタカナのみ)が空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end
      it "birth_dayが空だと登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end