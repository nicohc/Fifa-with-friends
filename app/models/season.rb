class Season < ApplicationRecord
  belongs_to :player, optional: true, foreign_key: "player_id"
  belongs_to :tournament, optional: true, foreign_key: "tournament_id"
  belongs_to :round, optional: true, foreign_key: "round_id"

  has_many :teams

end
