class UsersController < ApplicationController

  # before_action :check_if_logged_in, except: [:new, :create]

  def new
    @user = User.new
    @user.skills.build
    @skill_ids = @user.skills.pluck :id
  end

  def create

    @user = User.create user_params

    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to user_path @user.id
      

      if user_skill_params[:skills].present?
        skills = Skill.find user_skill_params[:skills]
        @user.skills << skills
      end
      
    else
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
    @skill_ids = @user.skills.pluck :id
  end

  def update
    @user = User.find params[:id]

      @user.skills.clear

    if @user.update user_params
      
      if user_skill_params[:skills].present?
        skills = Skill.find user_skill_params[:skills]
        @user.skills << skills
      end

      redirect_to user_path params[:id]

    else

      render :edit
      
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
        .permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :profile_pic, skills_attributes: [:skill_type])
  end

  def user_skill_params
    params.require(:user).permit(:skills => [])
    
  end
  
end
