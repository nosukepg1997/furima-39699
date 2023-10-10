FactoryBot.define do
  factory :user do
    nickname { Faker::Name.nickname }
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false) }
    password_confirmation { password }
    last_name { "試験のネーム" }
    first_name { "テストの名前" }
    last_name_kana { "シケンノネーム" }
    first_name_kana { "テストノナマエ" }
    date_of_birth { Faker::Date.between(from: 90.years.ago, to: 3.years.ago) }
  end
end
