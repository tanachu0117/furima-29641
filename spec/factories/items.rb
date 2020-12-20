FactoryBot.define do
  factory :item do
  name              {Faker::Name.initials(number: 2)}
  detail            {Faker::Lorem.sentence}
  category_id       {1}
  item_state_id     {1}
  shipping_fee_id   {1}
  prefecture_id     {1}
  shipping_days_id  {1}
  price             {1000}
  association :user 
  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
  end
end
