class ChangeAvatarFileSizeInUsersToInteger < ActiveRecord::Migration
  def change
    change_column :users, :avatar_file_size, :integer
  end
end
