FactoryBot.define do
  factory :product do
    name { Faker::Marketing.buzzwords }
    explanation { Faker::Lorem.paragraph }
    category_id { Faker::Number.between(from: 2, to: 11) }
    state_id { Faker::Number.between(from: 2, to: 7) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    load_id { Faker::Number.between(from: 2, to: 3) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    delivery_id { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
