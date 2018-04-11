class AddColumnStatusToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :status, :string
  end
end
