class SessionsController < ApplicationController
  def new
  end
  
  def create
     user = User.find_by_email(params[:email])
     if user && user.authenticate(params[:password])
       session[:uid] = user.id
       redirect_to users_url, notice: "Logged in!"
     else
       flash[:alert] = "Email or password is invalid"
       render "new"
     end
   end

   def destroy
     session[:uid] = nil
     redirect_to root_url, notice: "Logged out!"
   end   
end
