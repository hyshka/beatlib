class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :beat
  
  # only one favorite for each beat per user.
  validates_uniqueness_of :beat_id, :scope => [:user_id]
end
