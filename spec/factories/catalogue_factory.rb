FactoryBot.define do
  factory :catalogue do
    category { %w[movie season].sample }
    title { Faker::Book.title }
    plot { Faker::Quote.famous_last_words }
  end

  trait :season do
    category { 'season' }
  end

  trait :movie do
    category { 'movie' }
  end

  factory :season, traits: [:season]
  factory :movie, traits: [:movie]
end
