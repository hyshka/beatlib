class AddUserToBeats < ActiveRecord::Migration
  def change
    add_column :beats, :user, :string
  end
end
