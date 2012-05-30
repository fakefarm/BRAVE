class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
    @user = User.find_by_id(params[:id])
  end
  
  def create
    @user = User.create params[:user]
    if @user.save
      redirect_to root_url, notice: "Thank you for signing up! Please log in."
    else
      render "new"
    end
  end
end
