class Comment < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  validates_length_of :content, :maximum => 100
end
