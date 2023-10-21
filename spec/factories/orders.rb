FactoryBot.define do
  factory :order do
    post_code { "123-4567" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Name.name }
    street_address { Faker::Name.name }
    building { Faker::Name.name }
    telephone { Faker::Number.between(from: 1000000000, to: 99999999999) }
    token {"tok_abcdefghijk00000000000000000"}

  end
end