class Player < ApplicationRecord

  has_many :teams
  has_many :matches

  validates :pseudo, uniqueness: true

  has_many :seasons
  has_many :tournament, :through => :seasons

end
