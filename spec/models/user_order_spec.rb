require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
  @address = FactoryBot.build(:user_order)
  end
  describe '配送先入力' do
    it "建物情報が抜けていても、登録できること" do
      @address.building_name = nil
      @address.valid?
      expect(@address).to be_valid
    end

    it "すべての情報がある場合登録できること" do
      @address.valid?
      expect(@address).to be_valid
    end
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
    it "トークンが空では登録できないこと" do
      @address.token = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Token can't be blank")
    end
    it "郵便番号が空では登録できないこと" do
      @address.postal_code = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
    end
    it "市区町村が空では登録できないこと" do
      @address.city = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("City can't be blank")
    end
    it "番地が空では登録できないこと" do
      @address.city_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("City number can't be blank")
    end
    it "電話番号が空では登録できないこと" do
      @address.phone_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number can't be blank")
    end
    it "user_idが空では登録できないこと" do
      @address.user_id = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空では登録できないこと" do
      @address.item_id = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Item can't be blank") 
    end
    it "都道府県が0では登録できないこと" do
      @address.prefecture_id = 0
      @address.valid?
      expect(@address.errors.full_messages).to include("Prefecture can't be blank") 
    end
    it "電話番号が英数字混合では登録できないこと" do
      @address.phone_number = "abcdefg1234"
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is invalid. Unnecessary hyphen(-)") 
    end

  end
end