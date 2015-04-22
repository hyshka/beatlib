class User < ActiveRecord::Base
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
  
  # paperclip
  has_attached_file :avatar, styles: { medium: "150x150#", thumb: "70x70#" }, default_url: ->(attachment) { ':attachment/missing_:style.png' }
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_size :avatar, :in => 0..200.kilobytes
end
