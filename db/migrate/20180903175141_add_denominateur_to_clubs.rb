class AddDenominateurToClubs < ActiveRecord::Migration[5.1]
  def change
    add_column :clubs, :denominateur, :string
  end
end
