require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.build(:user, id: 1)
    item = FactoryBot.build(:item, id: 1, user_id: 2)
    item.image = fixture_file_upload('app/assets/images/logo.png')
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id, price: 300)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it '全ての項目が存在すれば商品が購入できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'cityが空だと購入できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと購入できない' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'prefecture_idが空だと購入できない' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'priceが空だと購入できない' do
        @order_address.price = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字以外だと購入できない' do
        @order_address.price = '３３３'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが300未満だと購入できない' do
        @order_address.price = 299
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Price is invalid')
      end
      it 'priceが10000000以上だと購入できない' do
        @order_address.price = 10_000_000
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Price is invalid')
      end
      it 'postal_codeが空だと購入できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank",'Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeに-(ハイフン)がないと購入できない' do
        @order_address.postal_code = 1_234_567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'phoneが空だと購入できない' do
        @order_address.phone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank", 'Phone is invalid')
      end
      it 'phoneに-(ハイフン)があると購入できない' do
        @order_address.phone = '0120-123-4567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneが12桁以上だと購入できない' do
        @order_address.phone = '012345678901'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneが全角だと購入できない' do
        @order_address.phone = '０１２０１２３４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end
      it 'prefecture_idが1だと購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
