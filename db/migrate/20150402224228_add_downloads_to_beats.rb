class AddDownloadsToBeats < ActiveRecord::Migration
  def change
    add_column :beats, :downloads, :integer, default: 0, null: false
  end
end
