class AgreementsController < ApplicationController
  def index
  end

  def new
    
  end

  def edit
  end

  def show
    @agreement = Agreement.find_by_id(params[:id])
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
