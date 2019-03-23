class Roundteam < ApplicationRecord
  belongs_to :round, optional: true, foreign_key: "round_id"
  belongs_to :season, optional: true, foreign_key: "season_id"
end
