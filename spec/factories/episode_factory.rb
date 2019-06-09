FactoryBot.define do
  factory :episode do
    association :catalogue, factory: [:catalogue, :season]
    sequence(:number)
    name { Faker::TvShows::BreakingBad.episode }
  end
end
