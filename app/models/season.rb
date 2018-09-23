class Season < ApplicationRecord
  belongs_to :player, optional: true, foreign_key: "player_id"
  belongs_to :tournament, optional: true, foreign_key: "tournament_id"

end
