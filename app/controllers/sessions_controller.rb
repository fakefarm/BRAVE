class SessionsController < ApplicationController
  
   before_filter :require_sign_in, :except  => [:new, :create]
  
  def new
  end
  
  def create
     user = User.find_by_email(params[:email])
     if user && user.authenticate(params[:password])
       session[:uid] = user.id
       redirect_to user_path(user.id), notice: "Logged in!"
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
