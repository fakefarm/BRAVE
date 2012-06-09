class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user

  def current_user
    @user = User.find(session[:uid]) if session[:uid]
  end
  
  def require_sign_in
    redirect_to new_session_url, notice: "Please Login" unless session[:uid]
  end


end
