FactoryBot.define do
  factory :user_order do
    user_id                       {"1"}
    item_id                       {"1"}
    postal_code                   {"123-4567"}
    prefecture_id                 {1}
    city                          {Faker::Address.city}
    city_number                   {"1-3"}
    building_name                 {"梅田ビル"}
    phone_number                  {"09000000000"}
    token                         {"1234567890"}
  end
end