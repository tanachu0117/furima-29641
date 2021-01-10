class UserDonation
  include ActiveModel::Model
  attr_accessor :card_nmuber, :expiration_date_manth, :expiration_date_year, :security_number, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number
