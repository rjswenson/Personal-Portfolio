class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = Project.new(params[:user])
    if @user.save
      flash[:success] = "Your account has been created!"
      redirect_to @user
    else
      render :new
    end

  end

end
