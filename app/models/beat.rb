class Beat < ActiveRecord::Base
  before_save :downcase_name

  # associations
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # validations
  validates :title, presence: true,
                    length: { in: 3..24 }
  validates :tag_list, presence: true

  # paperclip
  has_attached_file :midi, styles: { mp3: { format: :mp3 } },
                           processors: [:timidity]
                           #s3_credentials: "#{Rails.root.join('config', 's3.yml')}"
  validates_attachment_presence :midi
  validates_attachment_content_type :midi, :content_type => ["audio/midi"]
  validates_attachment_size :midi, :in => 0..10.kilobytes

  # acts as taggable on
  ## save order of tags
  acts_as_ordered_taggable
  ## convert array from multiple select to string
  serialize :tag_list

  private

  def downcase_name
    self.tag_list.map!{|c| c.downcase}
  end
end
