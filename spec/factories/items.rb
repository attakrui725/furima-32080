FactoryBot.define do
  factory :item do
    name { Faker::Name.initials(number: 2) }
    description            { '商品説明' }
    category_id            { 2 }
    status_id              { 2 }
    delivery_fee_id        { 2 }
    shipment_source_id     { 2 }
    day_to_ship_id         { 2 }
    price                  { 4000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
