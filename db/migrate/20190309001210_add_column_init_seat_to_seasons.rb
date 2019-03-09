class AddColumnInitSeatToSeasons < ActiveRecord::Migration[5.1]
  def change
    add_column :seasons, :init_seat, :integer
  end
end
