class Round < ApplicationRecord
  belongs_to :tournament, foreign_key: "tournament_id"
  has_many :matches, dependent: :destroy

  has_many :roundteams, dependent: :destroy
  has_many :seasons, :through => :roundteams
end
