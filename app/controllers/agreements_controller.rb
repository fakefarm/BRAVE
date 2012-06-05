class AgreementsController < ApplicationController
  
  before_filter :require_sign_in
  
  
  def index
    @agreements = Agreement.find_all_by_project_id(params[:project_id])
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
        Notifier.invitation(@agreement).deliver
        redirect_to projects_url
      else
        # flash.now alert: "Something has gone terribly wrong"
        render :text  => "stop"
      end
  end
end
