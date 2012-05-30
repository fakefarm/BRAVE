class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @project = Project.new
  end

  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to projects_url
    else
      flash.now alert: "Something has gone terribly wrong"
      render "new"
    end
  end

  def edit
    
  end

  def show
  @project = Project.new(:project)
  end
end
