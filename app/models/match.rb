class Match < ApplicationRecord

  validates :tournament_id, presence: true

  has_many :teams, dependent: :destroy
  accepts_nested_attributes_for :teams,
    allow_destroy: true,
    reject_if: :all_blank

  has_many :players, :through => :teams
  accepts_nested_attributes_for :players

  has_many :clubs, :through => :teams
  accepts_nested_attributes_for :clubs

  belongs_to :tournament, foreign_key: "tournament_id"
end
