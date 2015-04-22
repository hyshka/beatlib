class RenameFavoriteBeatIdInFavoritesToFavoriteId < ActiveRecord::Migration
  def change
  rename_column :favorites, :favorite_beat_id, :favorite_id
  end
end
