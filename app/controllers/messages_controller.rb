class MessagesController < ApplicationController
  
  def index
    @message = Message.new
    @project = Project.find_by_id(params[:project_id])
    @messages = @project.messages
  end
  
  def create
    @message = Message.new(params[:message])
    respond_to do |format|
      if @message.save
        format.js
        format.html { redirect_to project_messages_url, notice: "Message Posted" }
      else
        format.js
        redirect_to root_url, notice: "Error"
      end
    end
  end
  
  def destroy
    
  end
  
end
