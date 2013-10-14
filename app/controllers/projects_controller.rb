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
      redirect_to @project
    else
      flash[:alert] = "Project could not be saved."
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end
end
