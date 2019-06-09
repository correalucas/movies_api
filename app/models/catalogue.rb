class Catalogue < ApplicationRecord
  has_many :episodes
  has_many :options

  validates :category, :title, :plot, presence: true
  validates :category, inclusion: { in: %w[movie season] }
end
