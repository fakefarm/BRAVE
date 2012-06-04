class ProjectsController < ApplicationController
  
  before_filter :require_login
  def require_login
       @user = User.find_by_id(session[:uid])
       if @user.nil?
         redirect_to root_url, notice: "Please Log In"
       end
    end
 
  # before_filter :authorize_user
  
 
  # def authorize_user
  #    project = Project.find(params[:id])
  #     if project.agreement.user != @user
  #       redirect_to root_url, notice: "Please Log In!"
  #     end
  # end
  
  
  def index
    @projects = Project.all
    @project = Project.new
  end

  def new
    @project = Project.new
    @agreement = Agreement.new
  end
  
  def create
    @project = Project.new(params[:project])
      
    if @project.save
      Agreement.create title: "Group Admin", description: "I'm the Admin of this Project", is_admin: true, project_id: @project.id, user_id: session[:uid]
      redirect_to projects_url
      return
    else
      flash.now alert: "Something has gone terribly wrong"
      render "new"
    end
  end

  def edit
    
  end

  def show
    @project = Project.find_by_id(params[:id])
    # if @project.nil?
    @agreement = Agreement.new
  else
  end
end
