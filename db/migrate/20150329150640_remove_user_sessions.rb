class RemoveUserSessions < ActiveRecord::Migration
  def change
    drop_table :user_sessions
  end
end
