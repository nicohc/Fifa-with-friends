class Round < ApplicationRecord
  belongs_to :tournament
  has_many :matches
  has_many :seasons
end
