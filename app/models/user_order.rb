class UserOrder
  include ActiveModel::Model
  attr_accessor :token, :number, :exp_manth, :exp_year, :cvc, :postal_code, :prefecture_id, :city, :city_number, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
  validates :user_id    
  validates :item_id    
  validates :city       
  validates :city_number
  end
  
  with_options presence: true do
    # 「住所」の郵便番号に関するバリデーション
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    # 「住所」の都道府県に関するバリデーション
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :phone_number, length: { maximum: 11, message: "is invalid. Unnecessary hyphen(-)"}
  end

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    order = Order.create!(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, city_number: city_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end


end
