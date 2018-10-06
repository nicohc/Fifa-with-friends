class AddColumnDrawToSeasons < ActiveRecord::Migration[5.1]
  def change
    add_column :seasons, :draw, :integer, :default => 0
  end
end
