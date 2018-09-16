class AddTournamentToMatches < ActiveRecord::Migration[5.1]
  def change
    add_reference :matches, :tournament, foreign_key: true
  end
end
