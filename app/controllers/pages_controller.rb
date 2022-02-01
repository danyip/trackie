class PagesController < ApplicationController
  
  # before_action :check_if_logged_in  
  
  def home
    
    if !session[:user_id]
    # if user has a session
      # show their home page
    # else
      redirect_to login_path
    end
  end

end
