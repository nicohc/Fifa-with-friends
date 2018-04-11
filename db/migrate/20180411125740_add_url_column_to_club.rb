class AddUrlColumnToClub < ActiveRecord::Migration[5.1]
  def change
    add_column :clubs, :image_url, :string
  end
end
