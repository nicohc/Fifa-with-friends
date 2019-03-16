class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.string :step
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end
