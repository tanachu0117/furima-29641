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

  end
end
