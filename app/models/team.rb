class Team < ApplicationRecord
  belongs_to :match, optional: true, foreign_key: "match_id"
  belongs_to :player, optional: true, foreign_key: "player_id"

  validates :name, presence: true
  validates :score,
            :presence => {:message => "Le nombre de buts n'est pas indiqué." },
            :numericality => {:greater_than_or_equal_to => 0 , :message => "Le nombre de buts doit être positif." }


end
