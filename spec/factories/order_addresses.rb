FactoryBot.define do
  factory :order_address do
    zipcode { '123-4567' }
    area_id { 3 }
    city { '港区' }
    address1 { '1-1' }
    address2 { '東京ハイツ' }
    phone { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
