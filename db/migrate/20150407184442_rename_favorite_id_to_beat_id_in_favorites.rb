class RenameFavoriteIdToBeatIdInFavorites < ActiveRecord::Migration
  def change
    rename_column :favorites, :favorite_id, :beat_id
  end
end
