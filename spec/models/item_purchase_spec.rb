require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchase = FactoryBot.build(:item_purchase)
  end

  describe '商品購入機能の実装' do
    context '商品購入がうまくいく時' do
      it '全ての値が適切に入力されていれば購入できる' do
        expect(@item_purchase).to be_valid
      end

      it '建物名が入力されていなくても購入できる' do
        @item_purchase.building_name = ''
        expect(@item_purchase).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'tokenが空だと購入できない' do
        @item_purchase.token = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと購入できない' do
        @item_purchase.postal_code = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが6桁以下だと購入できない' do
        @item_purchase.postal_code = '123 - 456'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Postal code Input correctly')
      end

      it 'postal_codeが8桁以上だと購入できない' do
        @item_purchase.postal_code = '1234 - 5678'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Postal code Input correctly')
      end      

      it 'postal_codeにハイフンが含まれていないと購入できない' do
        @item_purchase.postal_code = '1_234_567'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Postal code Input correctly')
      end

      it 'postal_codeに数字、ハイフン以外の値があると購入できない' do
        @item_purchase.postal_code = 'あああaaaアアア'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Postal code Input correctly')
      end

      it 'prefecture_idが空(--)だと購入できない' do
        @item_purchase.prefecture_id = 0
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Prefecture Select')
      end

      it 'cityが空だと購入できない' do
        @item_purchase.city = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("City can't be blank")
      end

      it 'addressesが空だと購入できない' do
        @item_purchase.addresses = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Addresses can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @item_purchase.phone_number = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上だと購入できない' do
        @item_purchase.phone_number = 901234567891
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Phone number Input correctly')
      end

      it 'phone_numberに数字以外の値があると購入できない' do
        @item_purchase.phone_number = 'あああaaaアアア'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Phone number Input only number')
      end

      it 'userが紐づいていないと購入できない' do
        @item_purchase.user_id = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないと購入できない' do
        @item_purchase.item_id = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
