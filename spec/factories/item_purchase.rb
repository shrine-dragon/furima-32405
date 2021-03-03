FactoryBot.define do
  factory :item_purchase do
    postal_code   { Faker::Number.number(digits: 7) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city          { Faker::Address.city }
    house_number  { Faker::Address.street_address }
    building_name { Faker::Lorem.word }
    phone_number  { Faker::Number.leading_zero_number(digits: 11) }
  end
end
