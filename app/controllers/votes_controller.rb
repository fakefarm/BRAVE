class VotesController < ApplicationController
  def new
  end

  def create
    @vote=Vote.create(params[:vote])
    if @vote.save
    redirect_to projects_url, notice: "Thank you for Casting your Vote"
    else
    redirect_to projects_url, notice: "Please Try Again"
    end
  end
  
  def delete
  end
end
