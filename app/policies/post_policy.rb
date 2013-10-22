class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
        scope.all
      elsif user.present? && user.author?
        scope.where(author_id: user.id) | scope.published
      else
        scope.where(published: true)
      end
    end
  end

  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    if user.present?
      user.author? || user.editor?
    end
  end

  def update?
    post.authored_by?(user) || user.editor? if user.present?
  end
    alias_method :destroy?, :update?
    alias_method :edit?, :update?

  def publish?
    user.editor? if user.present?
  end
end
