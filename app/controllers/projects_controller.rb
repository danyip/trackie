class ProjectsController < ApplicationController
  
  # before_action :check_if_logged_in

  def new
    @project = Project.new
    @project.tasks.build
  end

  def create
    @project = Project.create project_params

    if @project.persisted?
      redirect_to project_path @project.id
      
      if project_user_params[:user_ids]
        users = User.find project_user_params[:user_ids]
    
        @project.users << users
      else
        @project.users << @current_user
      end

    else
      render :new
    end
  end

  def index
    @projects = Project.order "priority"
  end

  def show
    @project = Project.find params[:id]
    
    if @project.tasks.count != 0
      num_all_tasks = @project.tasks.count.to_f
      complete_tasks = @project.tasks.where status: 1
      num_complete_tasks = complete_tasks.count.to_f
      @percentage_done = ((num_complete_tasks / num_all_tasks)*100).round
    end
    
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    @project = Project.find params[:id]
    
    if @project.update project_params
      @project.users.clear
    
      if project_user_params[:user_ids]
        users = User.find project_user_params[:user_ids]
        @project.users << users
        redirect_to project_path params[:id]
      else
        @project.users << @current_user
        redirect_to project_path params[:id]
      end

    else
      render :edit
    end
  end

  def destroy
    Project.destroy params[:id]
    redirect_to projects_path
  end

  private

  def project_params
    params
      .require(:project)
        .permit(:title, :description, :due_date, :priority, tasks_attributes: [:title, :description, :due_date, :status, :priority, :project_id, :user_id])
  end 

  def project_user_params
    params.require(:project).permit(:user_ids => [])
  end



end
