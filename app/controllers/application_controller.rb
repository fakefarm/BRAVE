class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_sign_in
    @user = User.find_by_id(session[:uid])
    if @user.nil?
      redirect_to root_url, notice: 'Please sign in first!'
    end
  end

end
