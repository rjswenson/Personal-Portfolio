class CommentsController < ApplicationController
  before_filter :authenticate_user!
  #@post = Post.find(params[:post_id])

  def create
    @comment = Comment.new(params[:comment])
    @post = @comment.post

    if @comment.save
      #notice[:success] = "Comment Created! Pending Approval."
      redirect_to @post
    else
      render template: "posts/show"
    end
  end
end
