FactoryBot.define do
  factory :user do
    nickname { 'ヤマタロ' }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_furi { 'ヤマダ' }
    first_name_furi { 'タロウ' }
    birth { '2000-1-1' }
  end
end
