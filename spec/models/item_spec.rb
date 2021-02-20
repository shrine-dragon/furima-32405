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
      
    end
  end
end
