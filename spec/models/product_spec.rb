require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品の出品' do
    before do
      @product = FactoryBot.create(:product)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it 'すべての内容が正しく保存されている場合' do
        expect(@product).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it '画像が空では保存できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では保存できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空では保存できない' do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーが正しく選択されていない場合は保存できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態が正しく選択されていない場合は保存できない' do
        @product.state_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("State can't be blank")
      end
      it '価格が空の場合保存できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の値が300未満では保存できない' do
        @product.price = 200
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の値が10000000以上では保存できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格が半角数字以外では保存ができない' do
        @product.price = '４０００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it '配送料負担が正しく選択されていない場合保存できない' do
        @product.load_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Load can't be blank")
      end
      it '配送元の地域が正しく選択されていない場合保存できない' do
        @product.area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Area can't be blank")
      end
      it '配送日時が正しく選択されていない場合保存できない' do
        @product.delivery_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery can't be blank")
      end
    end
  end
end
