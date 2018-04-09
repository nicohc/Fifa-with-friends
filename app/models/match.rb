class Match < ApplicationRecord

  has_many :teams, dependent: :destroy
  accepts_nested_attributes_for :teams,
    allow_destroy: true,
    reject_if: :all_blank

  has_many :players, :through => :teams
  accepts_nested_attributes_for :players

  has_many :clubs, :through => :teams
  accepts_nested_attributes_for :clubs

  has_one :winner_club , as: :club, foreign_key: "club_id"
  has_one :loser_club , as: :club, foreign_key: "club_id"

end
