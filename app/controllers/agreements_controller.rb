class AgreementsController < ApplicationController
  def index
  end

  def new
    @agreement = Agreement.new
  end

  def edit
    @agreement = Agreement.find_by_id(params[:id])
  end

  def show
  end
end
