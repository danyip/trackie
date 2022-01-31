class ApplicationController < ActionController::Base

  # A before action that is set here in ApplicationController will be run before any action in any controller
  before_action :fetch_user
  
  def fetch_user
    
    if session[:user_id].present?
      @current_user = User.find_by id: session[:user_id]
    end 

    session[:user_id] = nil unless @current_user.present?

  end # fetch_user

  def check_if_logged_in
    unless @current_user.present?
      redirect_to login_path
    end
  end

end #class ApplicationController
