require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.create(:user)
    end
    context '内容に問題がない場合' do
      it 'すべての内容が正しく入力されている' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nicknameが空の場合' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空の場合' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailの内容が重複した場合' do
        user1 = FactoryBot.build(:user, email: @user.email)
        user1.valid?
        expect(user1.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がない場合' do
        @user.email = 'aaabbbccc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空の場合' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが129文字以上ある場合' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordが5文字以下の場合' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英字のみでは保存できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include half-width alphanumeric characters')
      end
      it 'passwordが半角数字のみでは保存できない' do
        @user.password = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include half-width alphanumeric characters')
      end
      it 'passwordは全角英数字では保存されない' do
        @user.password = 'ああああ１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include half-width alphanumeric characters')
      end
      it 'passwordとpassword_confirmationが不一致の場合' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'bbbbbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空の場合' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角文字ではないとき' do
        @user.last_name = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
      end
      it 'first_nameが空の場合' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角文字ではないとき' do
        @user.first_name = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'last_name_furiが空の場合' do
        @user.last_name_furi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furi can't be blank")
      end
      it 'last_name_furiが全角カタカナでない場合' do
        @user.last_name_furi = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name furi is invalid. Input full-width katakana characters.')
      end
      it 'first_name_furiが空の場合' do
        @user.first_name_furi = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furi can't be blank")
      end
      it 'first_name_furiが全角カタカナでない場合' do
        @user.first_name_furi = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name furi is invalid. Input full-width katakana characters.')
      end
      it 'birthが空の場合' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
