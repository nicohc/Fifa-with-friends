class Round < ApplicationRecord
  belongs_to :tournament
  has_many :matches

  has_many :roundteams
  has_many :seasons, :through => :roundteams
end
