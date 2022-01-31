class SessionController < ApplicationController
  def new
  end

  def create
    
    # 1. Check if the email address entered is actually in the DB
    user = User.find_by email: params[:email]

    # 2. did we actaully find a user row for that email address (or was it nil) and if we did find a user is the password correct
    if user.present? && user.authenticate( params[:password])
      
      session[:user_id] = user.id #saving a key/value into the 'session' hash

      redirect_to root_path
    
    else

      # Flash hash is a bit like session in that it is remembered accross page requests, BUT ONLY FOR THE VERY NEXT PAGE LOAD. Show error or status messages about something that happened on the previous request.
      flash[:error] = "Invalid email of password"
      
      redirect_to login_path

    end



  end

  def delete
    session[:user_id] = nil # logs out the user

    redirect_to login_path # back to the login page

  end
end
