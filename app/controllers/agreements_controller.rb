class AgreementsController < ApplicationController
  
  before_filter :require_login
  def require_login
       @user = User.find_by_id(session[:uid])
       if @user.nil?
         redirect_to root_url, notice: "Please Log In"
       end
    end
  
  # before_filter :authorize_user
  
 
  
  
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
        redirect_to projects_url
      else
        flash.now alert: "Something has gone terribly wrong"
        render "new"
      end
  end
end
