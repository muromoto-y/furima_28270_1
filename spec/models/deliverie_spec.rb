require 'rails_helper'
describe Deliverie, type: :model do

  before do
    @item = FactoryBot.build(:deliverie_purchase)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "クレジット番号と有効期限とセキュリティコードと郵便番号と都道府県と市区町村と番地と電話番号があると登録できる" do
      end
    end
  end

