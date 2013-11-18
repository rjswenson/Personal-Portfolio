class Project < ActiveRecord::Base
  attr_accessible :name, :technologies_used, :image, :remote_image_url
  validates :name, presence: true, length: { in: 4..255 }
  validates :technologies_used, presence: true

  has_many :comments, as: :commentable
  mount_uploader :image, ImageUploader
end
