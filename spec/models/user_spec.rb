require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録がうまくいくとき' do
      it "全ての項目が存在し、パスワードが６文字以上であれば登録できる" do
        @user.lastname = '野原'
        @user.firstname = 'ひろし'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@が含まれないと登録できない" do
        @user.email = 'hiroshi.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが６文字未満だと登録できない" do
        @user.password = 'aaa00'
        @user.password_confirmation = 'aaa00'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが英字だけだと登録できない" do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
      it "passwordが数字だけだと登録できない" do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
      it "passwordが全角だと登録できない" do
        @user.password = 'ＡＡＡ０００'
        @user.password_confirmation = 'ＡＡＡ０００'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
      it "password_confirmationがpasswordと一致しないと登録できない" do
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "lastnameが空だと登録できない" do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it "lastnameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.lastname = 'NOHARA'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname is invalid")
      end
      it "firstnameが空だと登録できない" do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it "firstnameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.firstname = 'HIROSHI'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid")
      end
      it "lastkanaが空だと登録できない" do
        @user.lastkana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastkana can't be blank")
      end
      it "lastkanaが全角（カタカナ）でないと登録できない" do
        @user.lastkana = 'のはら'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastkana is invalid")
      end
      it "firstkanaが空だと登録できない" do
        @user.firstkana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstkana can't be blank")
      end
      it "firstkanaが全角（カタカナ）でないと登録できない" do
        @user.firstkana = 'ひろし'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstkana is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
