class AddRoundToSeasons < ActiveRecord::Migration[5.1]
  def change
    add_reference :seasons, :round, foreign_key: true
  end
end
