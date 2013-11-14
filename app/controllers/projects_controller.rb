class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Project was successfully added."
      respond_to do |format|
        format.html { redirect_to @project }
        format.js
    else
      flash[:alert] = "Project could not be saved."
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    @commentable = @project
    @comments = policy_scope(@project.comments)
    @comment = Comment.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = "Project was successfully updated."
      redirect_to @project
    else
      flash[:alert] = "Project could not be saved."
      render :edit
    end
  end

  def destroy
    if true #for future admin control
      Project.find(params[:id]).destroy
      flash[:success] = "Project was successfully deleted."
      redirect_to projects_path
    else
      redirect_to root_path
    end
  end

end
