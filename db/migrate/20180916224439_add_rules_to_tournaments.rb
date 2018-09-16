class AddRulesToTournaments < ActiveRecord::Migration[5.1]
  def change
    add_column :tournaments, :win_regular_points, :integer
    add_column :tournaments, :win_prol_points, :integer
    add_column :tournaments, :win_peno_points, :integer
    add_column :tournaments, :lose_regular_points, :integer
    add_column :tournaments, :lose_prol_points, :integer
    add_column :tournaments, :lose_peno_points, :integer
    add_column :tournaments, :draw_regular_points, :integer
  end
end
