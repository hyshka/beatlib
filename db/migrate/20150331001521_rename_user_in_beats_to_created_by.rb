class RenameUserInBeatsToCreatedBy < ActiveRecord::Migration
  def change
    rename_column :beats, :user, :created_by
  end
end
