class AgreementsController < ApplicationController
  
  before_filter :require_sign_in
  before_filter :user_belongs_to_agreement, :only  => :show
  before_filter :is_super_admin, :only => :index
  
  def user_belongs_to_agreement
    @project = Agreement.find(params[:id]).project
    agreement = Agreement.find_by_user_id_and_id(current_user, params[:id])
      if agreement.nil? && @project.admin != current_user
      redirect_to root_url, notice: "Nice Try!"
    end
  end
  
  def index
    @agreements = Agreement.all
  end

  def new
    @agreement = Agreement.new
  end

  def edit
    @agreement = Agreement.find_by_id(params[:id])
    @project  = @agreement.project
  end

  def show
    @agreement = Agreement.find_by_id(params[:id])
    @agreements = Agreement.find_all_by_project_id(params[:project_id])
    @project = @agreement.project
  end
  
  def update
    @agreement = Agreement.find_by_id(params[:id])
    @agreement.update_attributes(params[:agreement])
    @agreement.save
    redirect_to project_path(@agreement.project.id)
  end
  
  
  def create
      @agreement = Agreement.new(params[:agreement])
      if @agreement.save
      # Notifier.invitation(@agreement).deliver
      redirect_to projects_url, notice:"Great Stuff"
      else
        flash[:notice] =  "Please include relevant information"
        redirect_to project_path(@agreement.project.id)
      end
      
  end
  
  def destroy
      @agreement = Agreement.find_by_id(params[:id])
      @agreement.destroy
    flash[:notice] = "Record Deleted"
    redirect_to projects_url
  end
  
end
