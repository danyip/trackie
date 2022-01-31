class SkillsController < ApplicationController
  
  # before_action :check_if_logged_in

  def new
  end

  def create
  end

  def index
    @skills = Skill.order "skill_type"
  end

  def show
    @skill = Skill.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
    Skill.destroy params[:id]
    redirect_to skills_path
  end
end
