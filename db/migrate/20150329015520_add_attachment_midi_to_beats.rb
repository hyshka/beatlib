class AddAttachmentMidiToBeats < ActiveRecord::Migration
  def self.up
    change_table :beats do |t|
      t.attachment :midi
    end
  end

  def self.down
    remove_attachment :beats, :midi
  end
end
