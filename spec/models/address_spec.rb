require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
  @address = FactoryBot.build(:user)
  end

  describe '配送先入力' do
    it "phone_number,postal_code,prefacture_idが存在すれば登録できる" do
      expect(@address).to be_valid
    end
    
  end
end