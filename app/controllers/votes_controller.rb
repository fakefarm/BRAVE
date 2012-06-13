class VotesController < ApplicationController
  def new
  end

  def create
    vote =Vote.where({votee_id: current_user.id, voter_id: params[:vote][:voter_id], project_id: params[:vote][:project_id]})
    if vote 
      redirect_to projects_url, notice: "Only One Vote per Team Member Please"
    else  
      @vote=Vote.new
      @vote.rank=(params[:rank])
      @vote.votee_id=(params[:vote][:votee_id])
      @vote.voter_id=(params[:vote][:voter_id])
      if @vote.save
        redirect_to projects_url, notice: "Thank you for Casting your Vote"
      else
        redirect_to projects_url, notice: "Please Try Again"
      end
    end
  end
  
  def delete
  end
end
