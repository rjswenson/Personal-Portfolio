class CommentPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
        scope.all
      elsif user.present? && user.author?
        scope.where(author_email: user.email) + scope.where(approved: true)
      else
        scope.where(approved: true)
      end
    end
  end

  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    user.present?
  end

  def update?
    comment.authored_by?(user) || user.editor? if user.present?
  end

  def approved?
    user.editor? if user.present?
  end
  alias_method :destroy?, :approved?
end
