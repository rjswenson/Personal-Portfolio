class Post < ActiveRecord::Base
  attr_accessible :body, :title, :published, :author_id

  has_many :comments, as: :commentable

  belongs_to :author, class_name: "User"
  scope :published, where(published: true)

  before_save :render_body

  def publish!
    self.published = true
    save!
  end

  def authored_by?(user)
    author == user
  end
end
