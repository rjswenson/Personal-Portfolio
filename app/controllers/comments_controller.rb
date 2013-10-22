class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @comment = Comment.new(params[:comment])
    @post = @comment.post

    if @comment.save
      flash[:success] = "Comment Created! Pending Approval."
      redirect_to @post
    else
      render template: "posts/show"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment Approved!"
      redirect_to post_path(@comment.post_id)
    else
      flash[:alert] = "Comment not approved."
      redirect_to post_path(@comment.post_id)
    end
  end
end
