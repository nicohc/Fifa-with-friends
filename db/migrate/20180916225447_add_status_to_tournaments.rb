class AddStatusToTournaments < ActiveRecord::Migration[5.1]
  def change
    add_column :tournaments, :finished, :boolean
  end
end
