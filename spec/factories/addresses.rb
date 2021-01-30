FactoryBot.define do
  factory :address do
    postal_code                   {"123-4567"}
    prefecture_id                 {"1"}
    city                          {Faker::Address.city}
    city_number                   {"1-3"}
    building_name                 {"梅田ビル"}
    phone_number                  {"0900000000"}
    order_id                      {"1"}
    order
  end
end
