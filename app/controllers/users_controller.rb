class UsersController < ApplicationController

  before_action :check_if_logged_in, except: [:new, :create]

  def new
    @user = User.new
    @user.skills.build # This is to make a new skill whilst creating a user
  end

  def create

    @user = User.new user_params
    
    if params[:user][:profile_pic].present?

      response = Cloudinary::Uploader.upload params[:user][:profile_pic]
    
      @user.profile_pic = response['public_id']

    end

    @user.save

    if @user.persisted? # if user create was sucessful
      
      session[:user_id] = @user.id # set the session user id (log in the user) 
      
      if user_skill_params[:skills].present? # if some skills were selected from the existing skills
        skills = Skill.find user_skill_params[:skills]  #grab those skills
        @user.skills << skills # push to join table
      end

      redirect_to user_path @user.id #redirect to the users show page 
      
    else # if create was unsuscessful, go back to the form
      render :new
    end

  end

  def index
    @users = User.order :first_name
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
   
  end

  def update

    
    @user = User.find params[:id]

    if params[:user][:profile_pic].present?

      response = Cloudinary::Uploader.upload params[:user][:profile_pic]
    
      @user.profile_pic = response['public_id']

    end

    skills_before_update = Skill.all.ids # grab the list of skills

    if @user.update user_params # if the update is sucessful
      @user.skills.clear # clear all skill associations for the user
      new_skills = Skill.find (Skill.all.ids  - skills_before_update) # grab the new skills
      @user.skills << new_skills # push them on

      if user_skill_params[:skills].present? # if some exisiting skills were selected
        skills = Skill.find user_skill_params[:skills] # grab them
        @user.skills << skills # push them into the join table
      end

      redirect_to user_path params[:id] # redirect to the user show page

    else # if update unsucessful

      render :edit # back to the form we go...
      
    end
  end

  def destroy
    User.destroy params[:id]
    redirect_to users_path
  end

  private

  def user_params
    params
      .require(:user)
        .permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, skills_attributes: [:skill_type])
  end

  def user_skill_params # this contains the skills that a user has from the EXISTING skills checkboxes
    params.require(:user).permit(:skills => [])  
  end
  
end
