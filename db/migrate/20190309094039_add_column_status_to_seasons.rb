class AddColumnStatusToSeasons < ActiveRecord::Migration[5.1]
  def change
    add_column :seasons, :status, :string
  end
end
