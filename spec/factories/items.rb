FactoryBot.define do
  factory :item do
    image           { Faker::Avatar.image }
    name            { Faker::Commerce.product_name }
    description     { Faker::Lorem.sentece }
    category_id     { Faker::Number.between(from: 1, to: 10) }
    quality_id      { Faker::Number.between(from: 1, to: 6) }
    burden_fee_id   { Faker::Number.between(from: 1, to: 2) }
    prefecture_id   { Faker::Number.between(from: 1, to: 47) }
    days_to_ship_id { Faker::Number.between(from: 1, to: 3) }
    price           { Faker::Number.between(from: 300, to: 9999999) }
  end
end
