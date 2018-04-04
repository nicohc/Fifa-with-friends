class Match < ApplicationRecord
=begin
  has_one :home_team, class_name: "Team"
  has_one :visiting_team, class_name: "Team"

  accepts_nested_attributes_for :home_team, allow_destroy: true
  accepts_nested_attributes_for :visiting_team, allow_destroy: true
=end
  has_many :teams
  accepts_nested_attributes_for :teams,
    :allow_destroy => true,
    :reject_if     => :all_blank

  has_many :players, :through => :teams
  accepts_nested_attributes_for :players

end
