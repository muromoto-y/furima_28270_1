require 'rails_helper'
describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item, :with_image)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "商品名と商品説明とカテゴリーと商品の状態と送料の負担と発送元の地域と発送までの日数と価格の情報と画像があるとき出品できる" do
        expect(@item).to be_valid
      end
      it "価格が300円以上なら出品できる" do
        @item.price = 300
        expect(@item).to be_valid
      end
      it "価格が9999999円以下なら出品できる" do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "商品名がないと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明がないと出品できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーidが1だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category カテゴリーを選択してください")
      end
      it "商品の状態の情報のidが1だと出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status 状態を選択してください")
      end
      it "配送料の負担の情報のidが1だと出品できない" do
        @item.shipping_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping burden 送料の負担者を選択してください")
      end
      it "発送元の地域の情報のidが1だと出品できない" do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area 配送元の地域を選択してください")
      end
      it "発送までの日数の情報のidが1だと出品できない" do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days 発送までの期間を選択してください")
      end
      it "価格の情報がないと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が299円以下なら出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 価格は300円~9,999,999円で設定してください")
      end
      it "価格が10000000円以上なら出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 価格は300円~9,999,999円で設定してください")
      end
      it "画像が０枚だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end  