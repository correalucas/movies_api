class Option < ApplicationRecord
  belongs_to :catalogue

  validates :name, :description, :expiration, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.0 }
end
