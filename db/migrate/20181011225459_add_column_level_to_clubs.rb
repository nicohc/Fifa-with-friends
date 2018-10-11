class AddColumnLevelToClubs < ActiveRecord::Migration[5.1]
  def change
    add_column :clubs, :level, :decimal, :scale => 1, :precision => 2
  end
end
