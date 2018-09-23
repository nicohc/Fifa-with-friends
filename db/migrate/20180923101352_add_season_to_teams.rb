class AddSeasonToTeams < ActiveRecord::Migration[5.1]
  def change
    add_reference :teams, :season, foreign_key: true
  end
end
