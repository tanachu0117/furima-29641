class UserDonation
  include ActiveModel::Model
  attr_accessor :card_nmuber, :expiration_date_manth, :expiration_date_year, :security_number, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number

  validates :card_nmuber            , presence: true
  validates :expiration_date_manth  , presence: true
  validates :expiration_date_year   , presence: true
  validates :security_number        , presence: true

  with_options presence: true do
    # 「住所」の郵便番号に関するバリデーション
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    # 「寄付金」に関するバリデーション
    validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
    # 「住所」の都道府県に関するバリデーション
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    # 「寄付金」の金額範囲に関するバリデーション
    validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is out of setting range"}
  end
  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    user = User.create
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name,user_id: user.id)
    # 寄付金の情報を保存
    Donation.create(price: price, user_id: user.id)
  end


end
