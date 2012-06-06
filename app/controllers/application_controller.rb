class ApplicationController < ActionController::Base
  protect_from_forgery

  
  def require_sign_in
    if @user.nil?
      redirect_to root_url, notice: 'Please sign in first!'
    else
    @user = User.find_by_id(session[:uid])
    end
  end
  

end
