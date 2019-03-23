class Season < ApplicationRecord
  belongs_to :player, optional: true, foreign_key: "player_id"
  belongs_to :tournament, optional: true, foreign_key: "tournament_id"

  has_many :roundteams, dependent: :destroy
  accepts_nested_attributes_for :roundteams,
    allow_destroy: true,
    reject_if: :all_blank

  has_many :rounds, :through => :roundteams
  accepts_nested_attributes_for :rounds

  has_many :teams

end
