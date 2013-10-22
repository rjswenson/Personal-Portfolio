class Post < ActiveRecord::Base
  attr_accessible :body, :title, :published, :author_id

  has_many :comments

  belongs_to :author, class_name: "User"
  scope :published, where(published: true)

  def publish!
    self.published = true
    save!
  end

  def authored_by?(user)
    author == user
  end
end
