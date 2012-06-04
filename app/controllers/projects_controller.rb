class ProjectsController < ApplicationController
  
  before_filter :require_sign_in
  
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
    @agreement = Agreement.new
  end
end
