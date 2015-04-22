class RenameCreatedByInBeatsToUserId < ActiveRecord::Migration
  def change
    rename_column :beats, :created_by, :user_id
  end
end
