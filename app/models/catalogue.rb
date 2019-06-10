class Catalogue < ApplicationRecord
  has_many :episodes, -> { order(:number) }
  has_many :options

  validates :category, :title, :plot, presence: true
  validates :category, inclusion: { in: %w[movie season] }

  def self.movies
    where(category: 'movie')
  end

  def self.seasons
    where(category: 'season')
  end
end
