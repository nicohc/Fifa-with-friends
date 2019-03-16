class AddRoundToMatches < ActiveRecord::Migration[5.1]
  def change
    add_reference :matches, :round, foreign_key: true
  end
end
