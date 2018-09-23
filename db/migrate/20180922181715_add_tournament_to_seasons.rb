class AddTournamentToSeasons < ActiveRecord::Migration[5.1]
  def change
    add_reference :seasons, :tournament, foreign_key: true
  end
end
