class User < ActiveRecord::Base
  before_create :create_permalink

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  # associations
  has_many :beats, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites_associations, :class_name => "Favorite", dependent: :destroy
  has_many :favorites, dependent: :destroy #, :through => :favorites_associations, :source => :favorite

  # validations
  ## name cannot match our other routes
  validates_exclusion_of :name, :in => %w( login logout register password reconfirm confirmation user users beat beats upload system terms-of-service )
  ## unique name and email
  validates :name, presence: true,
                    length: { minimum: 3 },
                    uniqueness: true
  #validates :email, presence: true,
  #                  length: { minimum: 3 },
  #                  uniqueness: true
  validates :terms_of_service, acceptance: true

  # paperclip
  has_attached_file :avatar, styles: { medium: "150x150#", thumb: "70x70#" },
                             default_url: ->(attachment) { ':attachment/missing_:style.png' }
                             #s3_credentials: "#{Rails.root.join('config', 's3.yml')}"
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_size :avatar, :in => 0..200.kilobytes

  def to_param
    permalink
  end

  private

    def create_permalink
      self.permalink = name.downcase
    end
end
