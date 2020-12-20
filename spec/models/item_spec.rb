require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の登録' do
    it "全ての項目が存在すれば登録できる" do
      expect(@item).to be_valid
    end
    it "画像が空では登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "カテゴリーが空では登録できない" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end
    it "商品の状態が空では登録できない" do
      @item.item_state_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item state can't be blank", "Item state is not a number")
    end
    it "配送料の負担が空だと登録できない" do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank", "Shipping fee is not a number")
    end
    it "発送元の地域が空では登録できない" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
    end
    it "発送までの日数が空では登録できない" do
      @item.shipping_days_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days can't be blank", "Shipping days is not a number")
    end
    it "価格が空では登録できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格の範囲が、¥300~¥9,999,999の間であること" do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end
    it "価格の範囲が、¥300~¥9,999,999の間であること" do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end
    it "販売価格は半角数字のみ保存可能であること" do
      @item.price = "１"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
