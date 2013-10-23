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
      redirect_to @comment.post
    else
      flash[:alert] = "Comment not approved."
      @post = @comment.post
      render template: "posts/show"
    end
  end

  # def destroy
  #   @comment = Comment.find(params[:id])
  #   linky = @comment.post_id
  #   @comment.destroy
  #   flash[:notice] = "Comment Destroyed!"
  #   redirect_to posts_path(linky)
  # end
end
