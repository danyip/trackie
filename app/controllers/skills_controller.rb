class SkillsController < ApplicationController
  
  before_action :check_if_logged_in

  def new
    @skill = Skill.new
  end

  def create

    @skill = Skill.create skill_params

    if @skill.persisted?

      redirect_to skills_path

    else # if create was unsuscessful, go back to the form

      render :new
    
    end

  end

  def index
    @skills = Skill.order "skill_type"
  end

  def show
    @skill = Skill.find params[:id]
  end

  def edit
    @skill = Skill.find params[:id]
  end

  def update

    @skill = Skill.find params[:id]


    if @skill.update skill_params # if the task update is sucessful
        
      redirect_to skill_path params[:id] # redirect to the task
    else #if update unsucessful
      render :edit # back to the edit page
    end 

  end

  def destroy
    Skill.destroy params[:id]
    redirect_to skills_path
  end


  private

  def skill_params
    params
      .require(:skill)
        .permit(:skill_type)
  end

end
