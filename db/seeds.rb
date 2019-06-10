100.times do
  Catalogue.create(category: %w[movie season].sample, title: Faker::Book.title, plot: Faker::Quote.famous_last_words)
end

300.times do |i|
  Episode.create(catalogue_id: Catalogue.all.map(&:id).sample, number: i, name: Faker::TvShows::BreakingBad.episode)
end

Catalogue.all.each do |c|
  ['SD', 'HD', 'Ultra HD'].each do |n|
    Option.create(catalogue_id: c.id, name: n, description: Faker::Lorem.sentence, expiration: Faker::Number.number(1), price: Faker::Number.decimal(2) )
  end
end

100.times do
  User.create(email: Faker::Internet.email)
end

300.times do
  Library.create(user_id: User.all.map(&:id).sample, option_id: Option.all.map(&:id).sample)
end
