class AddFavoriteTypeToFavorites < ActiveRecord::Migration[7.1]
  def change
    add_column :favorites, :favorite_type, :string
  end
end
