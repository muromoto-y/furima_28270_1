require 'rails_helper'
describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "first_nameとlast_nameとfirst_name_furiganaとlast_name_furiganaとbirthdayとnicknameとemailとpasswordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "パスワードは6文字以上で英数字が混合であると登録できる" do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end
      it "名字と名前は全角（漢字・ひらがな・カタカナ）で入力すると登録できる" do
        @user.first_name = "室もト"
        @user.last_name ="よシ臣"
        expect(@user).to be_valid
      end
      it "名字と名前は全角（カナ）で入力すると登録できる" do
        @user.first_name_furigana = "タナカ"
        @user.last_name_furigana = "タロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "ニックネームが空であると登録できない" do
        @user.nickname = ""
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが空であると登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "パスワードが空であると登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "名字が空であると登録できない"do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名前が空であると登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "名字は英数字では登録できない" do
        @user.first_name = "000aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "名前は英数字では登録できない" do
        @user.last_name = "000aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "名字（カナ）が空であると登録できない" do
        @user.first_name_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank")
      end
      it "名前（カナ）が空であると登録できない" do
        @user.last_name_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
      end
      it "誕生日が空であると登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "メールアドレスは重複すると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスには＠を含まないと登録できない" do
        @user.email = "kkkkkkkkkk"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードは５文字以下では登録できない" do
        @user.password = "0000a"
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is too short (minimum is 6 characters)")
      end
      it "パスワードは半角数字のみでは登録できない" do
        @user.password = "345678"
        @user.password_confirmation = "345678"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "パスワードは半角英字のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "パスワードが存在してもパスワード確認が空では登録できない" do
        @user.password_confirmation = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end