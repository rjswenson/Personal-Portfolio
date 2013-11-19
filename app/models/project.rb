class Project < ActiveRecord::Base
  attr_accessible :name, :technologies_used, :image, :remote_image_url
  validates :name, presence: true, length: { in: 4..255 }
  validates :technologies_used, presence: true

  has_many :comments, as: :commentable
  mount_uploader :image, ImageUploader

  after_save :enqueue_image

  def image_name
    File.basename(image.path || image.filename) if image
  end

  def enqueue_image
    ImageWorker.perform_async(id, key) if !image_processed && key.present?
  end

  class ImageWorker
    include Sidekiq::Worker

    def perform(id, key)
      project = Project.find(id)
      project.key = key
      project.remote_image_url = project.image.direct_fog_url(with_path: true)
      project.save!
      project.update_column(:image_processed, true)
    end
  end
end
