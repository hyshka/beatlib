class AddIndexes < ActiveRecord::Migration
  def change
    add_index :comments, :user_id, name: 'index_comments_on_user_id'
    add_index :favorites, :beat_id, name: 'index_favorites_on_beat_id'
    add_index :favorites, :user_id, name: 'index_favorites_on_user_id'
    add_index :beats, :user_id, name: 'index_beats_on_user_id'
  end
end
