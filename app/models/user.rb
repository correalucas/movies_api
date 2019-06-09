class User < ApplicationRecord
  has_many :libraries

  validates :email, presence: true
  validates :email, uniqueness: true
end
