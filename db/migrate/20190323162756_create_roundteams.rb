class CreateRoundteams < ActiveRecord::Migration[5.1]
  def change
    create_table :roundteams do |t|
      t.references :round, foreign_key: true
      t.references :season, foreign_key: true
      t.timestamps
    end
  end
end
