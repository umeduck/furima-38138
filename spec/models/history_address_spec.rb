require 'rails_helper'

RSpec.describe HistoryAddress, type: :model do
  describe '商品の購入機能' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @history_address = FactoryBot.build(:history_address, user_id: user.id, product_id: product.id)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it 'すべての内容が正しく保存されている場合' do
        expect(@history_address).to be_valid
      end
      it '建物名が空でも保存できる' do
        @history_address.building_name = ''
        expect(@history_address).to be_valid
      end
      end
      
      context '内容に問題がある場合' do
      it '郵便番号が空では保存できない' do
        @history_address.postal_code = ''
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は半角かつハイフンがないと保存できない' do
        @history_address.postal_code = '１２３４５６７'
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が正しく選択されていない場合保存できない' do
        @history_address.area_id = 1
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("Area can't be blank")
      end
      it '市町村が空では保存できない' do
        @history_address.city = ''
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @history_address.house_number = ''
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空では保存できない' do
        @history_address.phone_number = ''
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が半角数字以外では保存できない' do
        @history_address.phone_number = '０９０１２３４１２３４'
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("Phone number is not a number")
      end
      it '携帯番号が10桁未満では保存できない' do
        @history_address.phone_number = '090'
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it '携帯番号が12桁以上では保存できない' do
        @history_address.phone_number = '090123451234'
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @history_address.user_id = nil
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("User can't be blank")
      end
      it '商品情報が紐付いていなければ投稿できない' do
        @history_address.product_id = nil
        @history_address.valid?
        expect(@history_address.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end