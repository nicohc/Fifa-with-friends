class Team < ApplicationRecord
  belongs_to :match, optional: true, foreign_key: "match_id"
  belongs_to :player, optional: true, foreign_key: "player_id"
  validates_presence_of :name
  validates_presence_of :score
end
