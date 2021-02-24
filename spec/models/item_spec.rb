require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)    
  end

  describe '商品出品機能' do
    context '商品出品がうまくいく時' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品がうまくいかない時' do
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと保存できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空だと保存できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")    
      end

      it 'category_idが空(--)だと保存できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it 'condition_idが空(--)だと保存できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end

      it 'burden_fee_idが空(--)だと保存できない' do
        @item.burden_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden fee must be other than 0")
      end

      it 'prefecture_idが空(--)だと保存できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it 'days_to_ship_idが空(--)だと保存できない' do
        @item.days_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 0")
      end

      it 'priceが空だと保存できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")    
      end

      it 'priceが全角だと保存できない' do
        @item.price = "あああａａａ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
      end

      it 'priceが半角でも、英字だと保存できない（半角数字のみ保存可能）' do
        @item.price = "aaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
      end

      it 'priceが299以下の場合は保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end

      it 'priceが10000000以上の場合は保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      
      it 'userが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
