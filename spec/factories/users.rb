FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    birthday              { 2020 }
    last_name_kana        { "やまだ" }
    first_name_kana       { "たろう" }
  end
end