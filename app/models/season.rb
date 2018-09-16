class Season < ApplicationRecord
  belongs_to :player, foreign_key: "player_id"
end
