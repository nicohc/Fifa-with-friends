class Tournament < ApplicationRecord

  has_many :matches

  has_many :seasons
  accepts_nested_attributes_for :seasons,
    allow_destroy: true


  has_many :players, :through => :seasons
  accepts_nested_attributes_for :players

end
