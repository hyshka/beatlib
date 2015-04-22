class AddUserIdToBeats < ActiveRecord::Migration
  def change
    add_column :beats, :user_id, :integer
  end
end
