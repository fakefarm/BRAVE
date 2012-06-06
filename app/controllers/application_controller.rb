class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_sign_in

  def require_sign_in
    @user = User.find_by_id(session[:uid])
    if @user.nil?
      redirect_to root_url, notice: 'Please sign in first!'
    end
  end
  

end
