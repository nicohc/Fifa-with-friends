class AddColumnToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :win, :integer, default: 0
    add_column :players, :win_prol, :integer, :default => 0
    add_column :players, :win_peno, :integer, :default => 0
    add_column :players, :lose, :integer, :default => 0
    add_column :players, :lose_prol, :integer, :default => 0
    add_column :players, :lose_peno, :integer, :default => 0
  end
end
