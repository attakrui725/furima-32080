FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    birthday              { Faker::Date.in_date_period }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
  end
end
