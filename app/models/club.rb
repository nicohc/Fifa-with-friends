class Club < ApplicationRecord

  has_many :teams
  validates :name, uniqueness: true

end
