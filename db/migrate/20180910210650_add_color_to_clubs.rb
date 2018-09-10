class AddColorToClubs < ActiveRecord::Migration[5.1]
  def change
    add_column :clubs, :color, :string
  end
end
