class AddColumnSeatToSeasons < ActiveRecord::Migration[5.1]
  def change
    add_column :seasons, :seat, :integer
  end
end
