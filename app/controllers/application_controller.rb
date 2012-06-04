class ApplicationController < ActionController::Base
  protect_from_forgery

  
  # def require_login
  #      @user = User.find_by_id(session[:uid])
  #      if @user.nil?
  #        redirect_to root_url, notice: "Please Log In"
  #      end
  #   end

   # def authorize_user
   #      agreement = Agreement.find(params[:id])
   #       if agreement.user != @user
   #         redirect_to root_url, notice: "Please Log In!"
   #       end
   #   end


  def require_sign_in
    @user = User.find_by_id(session[:uid])
    if @user.nil?
      redirect_to root_url, notice: 'Please sign in first!'
    end
  end
  
  # def require_authorization
  #   @project = Project.find_by_agreement_and_find_by_id(@user_id, params[:id])
  #   if @project.nil?
  #     redirect_to root_url, notice: 'Please sign in first!'
  #   end
  # end


end
