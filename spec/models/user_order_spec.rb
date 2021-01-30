require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
  @address = FactoryBot.build(:user_order)
  end

  describe '配送先入力' do
    it "phone_number,postal_code,prefacture_id,city,city_numberが存在すれば登録できる" do
      expect(@address).to be_valid
    end

    it "郵便番号にはハイフンが必要であること" do
      @address.postal_code = "123456"
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")

    end

    it "電話番号が11桁以内であること" do
      @address.phone_number = "123456789012"
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is invalid. Unnecessary hyphen(-)")
    end
    it "電話番号にはハイフンは不要であること" do
      @address.phone_number = "1234-567-8999"
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is invalid. Unnecessary hyphen(-)")
    end
  end
end