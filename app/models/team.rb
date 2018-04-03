class Team < ApplicationRecord
  belongs_to :match, optional: true, foreign_key: "match_id"

end
