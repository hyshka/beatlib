class Comment < ActiveRecord::Base
  belongs_to :beat
  belongs_to :user
  validates :user_id, presence: true
  validates :body, presence: true,
                   length: { minimum: 5 }
end
