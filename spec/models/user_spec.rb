require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do 
    it 'nicknameが空では登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      binding.pry
    end
    it 'emailが空では登録できない' do
    end
    it 'passwordが空では登録できない' do
    end
    it 'password_confirmationが空では登録できない' do
    end
    it 'last_nameが空では登録できない' do
    end
    it 'first_nameが空では登録できない' do
    end
    it 'last_name_kanaが空では登録できない' do
    end
    it 'first_name_kanaが空では登録できない' do
    end
    it 'birth_dayが空では登録できない' do
    end
  end
end
