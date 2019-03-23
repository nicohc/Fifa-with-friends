class DeleteRoundReferenceToSeasons < ActiveRecord::Migration[5.1]
  def change
    remove_reference :seasons, :round, foreign_key: true
  end
end
