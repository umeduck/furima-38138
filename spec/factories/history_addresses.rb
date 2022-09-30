FactoryBot.define do
  factory :history_address do
    postal_code {'123-4567'}
    area_id { Faker::Number.between(from: 2, to: 48) }
    city {'横浜市'}
    house_number {'青山1-1'}
    building_name {'メゾン青山'}
    phone_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}

    association :user
    association :product
    
  end
end
