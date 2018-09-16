class AddElementsToSeasons < ActiveRecord::Migration[5.1]
  def change
    add_column :seasons, :points, :integer, :default => 0
    add_column :seasons, :win, :integer, :default => 0
    add_column :seasons, :win_prol, :integer, :default => 0
    add_column :seasons, :win_peno, :integer, :default => 0
    add_column :seasons, :lose, :integer, :default => 0
    add_column :seasons, :lose_prol, :integer, :default => 0
    add_column :seasons, :lose_peno, :integer, :default => 0
  end
end
