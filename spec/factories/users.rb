FactoryBot.define do
  factory :user do
    name                      {Faker::Name.initials(number: 2)}
    email                         {Faker::Internet.free_email}
    password                      {"a1" + Faker::Internet.password(min_length: 4)}
    password_confirmation         {password}
    first_name                    {"田中"} #gimei
    last_name                     {"ユウヤ"}
    first_name_paseudnym_readeing {"タナカ"}
    last_name_paseudnym_readeing  {"ユウヤ"}
    birthday                      {"2020-10-01"}
  end
end
