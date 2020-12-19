require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nameが空だと登録できない" do
    @user.name = ""
    @user.valid?
    end
    it "emailが空では登録できない" do
    end
    it "passwordが空だと登録できない" do
    end
    it "last_nameが空では登録できない" do
    end
    it "first_nameが空では登録できない" do
    end
    it "last_name_が空では登録できない" do
    end
    it "first_name_が空では登録できない" do
    end
    it "birthdayが空では登録できない" do
    end

  end
end
