FactoryBot.define do
  factory :catalogue do
    category { %w[movie season].sample }
    title { Faker::Book.title }
    plot { Faker::Quote.famous_last_words }
  end

  trait :season do
    category { 'season' }
    title { Faker::Book.title }
    plot { Faker::Quote.famous_last_words }
  end

  trait :movie do
    category { 'movie' }
    title { Faker::Book.title }
    plot { Faker::Quote.famous_last_words }
  end

  factory :season, class: Catalogue, traits: [:season]
  factory :movie, class: Catalogue, traits: [:movie]
end
