class Tournament < ApplicationRecord

  has_many :matches, dependent: :destroy,
    allow_destroy: true

  has_many :seasons, dependent: :destroy
  accepts_nested_attributes_for :seasons,
    allow_destroy: true


  has_many :players, :through => :seasons
  accepts_nested_attributes_for :players

end
