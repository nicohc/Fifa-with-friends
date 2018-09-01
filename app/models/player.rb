class Player < ApplicationRecord

  has_many :teams
  has_many :matches

  validates :pseudo, uniqueness: true




end
