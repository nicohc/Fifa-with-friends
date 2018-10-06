class AddColumnModeToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :mode, :string
  end
end
