FactoryBot.define do
  factory :library do
    user
    option
    alive { [true, false].sample }
  end
end
