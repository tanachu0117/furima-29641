class UserOrder
  include ActiveModel::Model
  attr_accessor :card_nmuber, :expiration_date_manth, :expiration_date_year, :security_number, :postal_code, :prefecture_id, :city, :city_number, :building_name, :phone_number, :item_id, :user_id

  validates :card_nmuber            , presence: true
  validates :expiration_date_manth  , presence: true
  validates :expiration_date_year   , presence: true
  validates :security_number        , presence: true
  validates :user_id                , presence: true
  validates :item_id                , presence: true

  with_options presence: true do
    # 「住所」の郵便番号に関するバリデーション
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    # 「住所」の都道府県に関するバリデーション
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  end
  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, city_number: city_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end


end
