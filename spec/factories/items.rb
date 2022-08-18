FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to:11 ) }
    status_id { Faker::Number.between(from: 2, to:7 ) }
    cost_id { Faker::Number.between(from: 2, to:3 ) }
    area_id { Faker::Number.between(from: 2, to:48 ) }
    shipdate_id { Faker::Number.between(from: 2, to:4 ) }
    price  { Faker::Number.between(from: 300, to:9999999 ) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/suica.png'), filename: 'suica.png')
    end
  end
end
