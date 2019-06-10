FactoryBot.define do
  factory :library do
    user
    option
    alive { [true, false].sample }

    factory :library_alive do
      alive { true }
    end
  end
end
