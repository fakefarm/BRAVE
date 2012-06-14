class UsersController < ApplicationController

  before_filter :require_sign_in, :except => [:new, :create] 

  def index
    if params[:role].present?
      @users = User.find_all_by_role(params[:role][:description])
    else
     @users = User.all
    end
  end

  def new
    @user = User.new
    @roles=Role.all
  end

  def edit
  end

  def show
    @user = current_user
    @user_projects = @user.projects
  end
  
  def create
    @user = User.create params[:user]
    @user.role = params[:role][:description]
    if @user.save
      redirect_to root_url, notice: "Thank you for signing up! Please log in."
    else
      render text: "new"
    end
  end
end





