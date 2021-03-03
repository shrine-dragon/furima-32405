FactoryBot.define do
  factory :item_purchase do
    token {"tok_abcdefghijk00000000000000000"}    
    postal_code   { "123-4567" }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city          { Faker::Address.city }
    house_number  { Faker::Address.street_address }
    building_name { Faker::Lorem.word }
    phone_number  { Faker::Number.leading_zero_number(digits: 11) }
  end
end
