class AddColumnToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :win, :integer
    add_column :players, :win_prol, :integer
    add_column :players, :win_peno, :integer
    add_column :players, :lose, :integer
    add_column :players, :lose_prol, :integer
    add_column :players, :lose_peno, :integer
  end
end
