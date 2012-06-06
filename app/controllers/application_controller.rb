class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_sign_in

  def require_sign_in
    if @user.nil?
      redirect_to root_url, notice: 'Please sign in first!'
    else
    @user = User.find_by_id(session[:uid])
    end
  end
  

end
