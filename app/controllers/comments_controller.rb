class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      notice[:success] = "Comment Created! Pending Approval."
      redirect_to post_path
    else
      redirect_to post_path
    end
  end
end
