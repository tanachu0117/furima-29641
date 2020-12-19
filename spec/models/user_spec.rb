require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nameが空だと登録できない" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "last_nameが空では登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end
    it "last_name_paseudnym_readeingが空では登録できない" do
      @user.last_name_paseudnym_readeing = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name paseudnym readeing can't be blank", "Last name paseudnym readeing is invalid")
    end
    it "first_name_paseudnym_readeingが空では登録できない" do
      @user.first_name_paseudnym_readeing = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name paseudnym readeing can't be blank", "First name paseudnym readeing is invalid")
    end
    it "birthdayが空では登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "@同じemailのuserは登録することができない（重複確認）" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "@を含まないemailは登録することができない" do
      @user.email = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "5文字以下だと登録できないこと" do
      @user.password = '555aa'
      @user.password_confirmation = '555aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "英語のみでは登録できないこと" do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "数字のみでは登録できないこと" do
      @user.password = '666666'
      @user.password_confirmation = '666666'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "全角では登録できないこと" do
      @user.password = 'あああああああ'
      @user.password_confirmation = 'あああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordとpassword_confirmationは値が異なる場合は登録できない" do
      @user.password = 'yuya117'
      @user.password_confirmation = 'yuya0117'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが漢字・平仮名・カタカナ以外では登録できないこと" do
      @user.last_name = 'tanachu117'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "first_nameが漢字・平仮名・カタカナ以外では登録できないこと" do
      @user.first_name = 'tanachu117'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "first_name_paseudnym_readeingが全角カタカナ以外では登録できないこと" do
      @user.first_name_paseudnym_readeing = 'tanachu117'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name paseudnym readeing is invalid")
    end
    it "last_name_paseudnym_readeingが全角カタカナ以外では登録できないこと" do
      @user.last_name_paseudnym_readeing = 'tanachu117'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name paseudnym readeing is invalid")
    end
  end
end
