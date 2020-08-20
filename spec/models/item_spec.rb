require 'rails_helper'
describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it
    end
  end
end  

# ログインしていると出品ページに行ける
# 画像を１枚載せると出品できる
# 商品名があると出品できる
# 　商品説明があると
# 　カテゴリーがあると
# 　商品の状態の情報があると
# 　配送料の負担の情報があると
# 　発送元の地域の情報があると
# 　発送までの日数の情報があると
# 　価格の情報があると
# 価格が300円以上なら出品できる
# 　9999999円以下なら出品できる

# ログインしていないと出品ページにはいけない
# 画像が０枚だと出品できない
# 商品名がないと出品できない
# 商品説明がないと出品できない
# カテゴリーがないと出品できない
# 商品の状態の情報がないと出品できない
# 配送料の負担の情報がないと出品できない
# 発送元の地域の情報がないと出品できない
# 発送までの日数の情報がないと出品できない
# 価格の情報がないと出品できない
# 価格が299円以下なら出品できない
# 価格が10000000円以上なら出品できない