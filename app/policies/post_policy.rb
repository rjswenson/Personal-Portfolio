class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    if user.present?
    user.author? || user.editor?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.author? || user.editor?
        scope
      else
        scope.where(published: true)
      end
    end
  end
end
