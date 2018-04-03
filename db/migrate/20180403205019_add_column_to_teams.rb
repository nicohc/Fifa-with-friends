class AddColumnToTeams < ActiveRecord::Migration[5.1]
  def change
    add_reference :teams, :player, foreign_key: true
  end
end
