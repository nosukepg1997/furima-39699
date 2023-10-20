FactoryBot.define do
  factory :order do
    post_code { "123-4567" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Name.city }
    street_address { Faker::Name.street_address }
    building { Faker::Name.building }
    telephone { Faker::Number.between(from: 1000000000, to: 99999999999) }
    token {"tok_abcdefghijk00000000000000000"}

  end
end