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
  end

  def show
    @agreement = Agreement.find_by_id(params[:id])
    @agreements = Agreement.find_all_by_project_id(params[:project_id])
  end
  
  def update
    @agreement = Agreement.find_by_id(params[:id])
    @agreement.update_attributes(params[:agreement])
    @agreement.save
      redirect_to projects_url
  end
  
  
  def create
    @agreement = Agreement.new(params[:agreement])
    if @agreement.save
      redirect_to projects_url
    else
      flash[:notice] =  "Something has gone terribly wrong"
      render :text  => "stop"
    end
  end
  
  def destroy
      @agreement = Agreement.find_by_id(params[:id])
      @agreement.destroy
    flash[:notice] = "Record Deleted"
    redirect_to projects_url
  end
  
end
