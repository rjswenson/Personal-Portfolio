class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_commentable

  def create
    @comment = @commentable.comments.new(params[:comment])

    if @comment.save
      flash[:success] = "Comment Created! Pending Approval."
      redirect_to @commentable
    else
      instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
    end
  end

  def update
    @comment = @commentable.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Comment Approved!"
      redirect_to @commentable
    else
      flash[:alert] = "Comment not approved."
      instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])

    @comment.destroy
    flash[:notice] = "Comment Destroyed!"
    redirect_to @commentable
  end

private

  def load_commentable
    @resource, id = request.path.split('/')[1,2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end
end
