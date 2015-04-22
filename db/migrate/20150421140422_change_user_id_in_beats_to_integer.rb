class ChangeUserIdInBeatsToInteger < ActiveRecord::Migration
  def change
    change_column :beats, :user_id, :integer
  end
end
