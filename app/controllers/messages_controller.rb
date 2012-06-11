class MessagesController < ApplicationController
  
  def index
    @message = Message.new
    @project = Project.find_by_id(params[:project_id])
    @messages = @project.messages
  end
  
  def create
    @message = Message.new(params[:message])
    if @message.save
      redirect_to project_messages_url
    else
      redirect_to root_url
    end
  end
  
  def destroy
    
  end
  
end
