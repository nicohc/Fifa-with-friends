class AddTitleToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :title, :string
    add_column :matches, :image_une_url, :string
  end
end
