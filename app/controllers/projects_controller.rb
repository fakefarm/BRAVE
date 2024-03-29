class ProjectsController < ApplicationController

  before_filter :require_sign_in
  
  before_filter :user_belongs_to_project, :only  => :show
  
  def admin
    Project.find_by_id
      redirect_to root_url, notice: "Nice Try!"
  end
  
  def user_belongs_to_project
    agreement = Agreement.find_by_user_id_and_project_id(current_user, params[:id])
    admin_agreement = Agreement.find_by_id_and_is_admin(params[:id], true)
    if agreement.nil? && admin_agreement.nil?
      redirect_to root_url, notice: "Nice Try!"
    end
  end

  def index
    @vote = Vote.new
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
      Agreement.create title: "Group Admin", description: "I'm the Admin of this Project", is_admin: true, project_id: @project.id, user_id: session[:uid], is_active_user: true, is_active_admin: true
      Agreement.create title: "Project Client", description: "I'm the Client of this Project", is_admin: false, project_id: @project.id, user_id: User.find_by_email(params[:project][:client_email]).id, is_active_user: true, is_active_admin: true      
      redirect_to project_path(@project.id)
      return
    else
      flash.now alert: "Something has gone terribly wrong"
      render "new"
    end
  end

  def edit
    
  end

  def show
    @vote=Vote.new
    @project = Project.find_by_id(params[:id])
    @agreement = Agreement.new
    @project_agreements = @project.agreements
    @user_inactive_agreement = Agreement.where({user_id: current_user, project_id: params[:id], is_active_user: false}).first
    
  end
end
