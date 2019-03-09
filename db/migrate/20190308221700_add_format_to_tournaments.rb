class AddFormatToTournaments < ActiveRecord::Migration[5.1]
  def change
    add_column :tournaments, :format, :string
  end
end
