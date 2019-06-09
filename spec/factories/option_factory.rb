FactoryBot.define do
  factory :option do
    catalogue
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    expiration { Faker::Number.number(1) }
    price { Faker::Number.decimal(2) }
  end
end
