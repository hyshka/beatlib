class RemoveGenreFromBeats < ActiveRecord::Migration
  def change
    remove_column :beats, :genre, :string
  end
end
