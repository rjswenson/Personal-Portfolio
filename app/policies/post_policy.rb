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
  alias_method :update?, :create?

  def destroy?
    return true if user.editor?
    return true if user.id == post.author_id
  end

  def publish?
    user.editor?
  end

  def edit?
    return true if user.editor?
    return true if user.id == post.author_id
  end
end
