require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'post_code、prefecture_id、city、street_address、building(任意)、telephone、
      tokenが存在すれば登録できる' do
        expect(@order).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'post_codeが空では購入できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが「3桁ハイフン4桁」の半角文字列以外では購入できない' do
        @order.post_code = 'aiueo123'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end
      it 'prefecture_idが1(---)では購入できない' do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空では購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空では購入できない' do
        @order.street_address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephoneが空では購入できない' do
        @order.telephone = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが9桁以下の半角数字では購入できない' do
        @order.telephone = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneが12桁以上の半角数字では購入できない' do
        @order.telephone = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneが半角数字意外では購入できない' do
        @order.telephone = 'aiueokakiku'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone is invalid")
      end

      it "tokenが空では購入できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'ユーザーが紐付いていなければ購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it '商品が紐付いていなければ購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end