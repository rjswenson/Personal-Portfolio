class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.editor?
        scope.all
      elsif user.author?
        scope.where(author_id: user.id)
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
    user.editor?
  end

  def publish?
    user.editor?
  end
end
