class Beat < ActiveRecord::Base
  
  # associations
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # validations
  validates :title, presence: true,
                    length: { minimum: 5 }
    
  # paperclip
  has_attached_file :midi, :styles => { :mp3 => { :format => :mp3 } }, :processors => [:timidity]
  validates_attachment :midi, :presence => true,
  :content_type => { :content_type => "audio/midi" },
  :size => { :in => 0..10.kilobytes }
  
  # acts as taggable on
  ## save order of tags
  acts_as_ordered_taggable
  ## convert array from multiple select to string
  serialize :tag_list
end
