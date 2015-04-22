class AddCreatedByToBeats < ActiveRecord::Migration
  def change
    add_column :beats, :created_by, :string
  end
end
