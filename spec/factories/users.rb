FactoryBot.define do
  factory :user do
    nickname              {Faker::Name}
    email                 {Faker:Internet.free_email}
    password              {Faker:Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {Faker::First_name}
    first_name            {Faker::Last_name}
    last_name_kana        {Faker::First_name_kana}
    first_name_kana       {Faker::Last_name_kana}
    birth_day             {Faker::Birth_day}
  end
end
