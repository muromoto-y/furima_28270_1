require 'rails_helper'
describe Deliverie, type: :model do

  before do
    @deliverie = FactoryBot.build(:deliverie_purchase)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "郵便番号と都道府県と市区町村と番地と電話番号と購入者idと商品のidとtokenがあると登録できる" do
        expect(@deliverie).to be_valid
      end
      it "郵便番号は（３桁-４桁）となると登録できる" do
      @deliverie.post_code = "153-1094"
      expect(@deliverie).to be_valid
      end
      it "電話番号は10桁か11桁なら登録できる" do
        @deliverie.phone_number = "0760369483"
        expect(@deliverie).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "郵便番号がないと登録できない" do
        @deliverie.post_code = ""
        @deliverie.valid?
        expect(@deliverie.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号は-の位置が違うと登録できない" do
        @deliverie.post_code = "1543-765"
        @deliverie.valid?
        expect(@deliverie.errors.full_messages).to include("Post code is invalid")
      end
      it "郵便番号は-がないと登録できない" do
        @deliverie.post_code = "6765432"
        @deliverie.valid?
        expect(@deliverie.errors.full_messages).to include("Post code is invalid")
      end
      it "都道府県idが1だと登録できない" do
        @deliverie.shipping_area_id = "1"
        @deliverie.valid?
        expect(@deliverie.errors.full_messages).to include("Shipping area 配送先の地域を選択してください")
      end
      it "市区町村がないと登録できない" do
        @deliverie.city = ""
        @deliverie.valid?
        expect(@deliverie.errors.full_messages).to include("City can't be blank")
      end
      it "番地がないと登録できない" do
        @deliverie.address = ""
        @deliverie.valid?
        expect(@deliverie.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号がないと登録できない" do
        @deliverie.phone_number = ""
        @deliverie.valid?
        expect(@deliverie.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号は12桁以上だと登録できない" do
        @deliverie.phone_number = "098765432123"
        @deliverie.valid?
        expect(@deliverie.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号は9桁以下だと登録できない" do
        @deliverie.phone_number = "098765432"
        @deliverie.valid?
        expect(@deliverie.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenがないと登録できない" do
        @deliverie.token = ""
        @deliverie.valid?
        expect(@deliverie.errors.full_messages).to include("Token can't be blank")
      end
      it "購入者のidがないと登録できない" do
        @deliverie.user_id = ""
        @deliverie.valid?
        expect(@deliverie.errors.full_messages).to include("User can't be blank")
      end
      it "商品のidがないと登録できない" do
        @deliverie.item_id = ""
        @deliverie.valid?
        expect(@deliverie.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end