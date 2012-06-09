class UsersController < ApplicationController

  before_filter :require_sign_in, :except => [:new, :create] 

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit

  end

  def show
    @user = current_user
    @user_projects = @user.projects
    @pending_admin_agreements = @user.pending_admin_agreements
    @pending_user_agreements = @user.pending_user_agreements
  end
  
  def create
    @user = User.create params[:user]
    if @user.save
      redirect_to root_url, notice: "Thank you for signing up! Please log in."
    else
      render text: "new"
    end
  end
end
