class AddClubColumnToTeams < ActiveRecord::Migration[5.1]
  def change
    add_reference :teams, :club, foreign_key: true
  end
end
