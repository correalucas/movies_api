class Episode < ApplicationRecord
  belongs_to :catalogue

  validates :number, :name, presence: true
  validates :number, uniqueness: { scope: :catalogue_id }
end
