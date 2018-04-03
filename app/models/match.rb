class Match < ApplicationRecord

  has_one :home_team, class_name: "Team"
  has_one :visiting_team, class_name: "Team"

  accepts_nested_attributes_for :home_team, allow_destroy: true
  accepts_nested_attributes_for :visiting_team, allow_destroy: true

end
