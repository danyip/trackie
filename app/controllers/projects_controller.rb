class ProjectsController < ApplicationController
  
  
  def new
    @project = Project.new
    @project.tasks.build
  end

  def create
    project = Project.create! project_params
    users = User.find project_user_params[:user_ids]
    project.users << users
    redirect_to project_path project.id
  end

  def index
    @projects = Project.order "priority"
  end

  def show
    @project = Project.find params[:id]
    
    num_all_tasks = @project.tasks.count.to_f
    complete_tasks = @project.tasks.select {| task | task.status == 1 }
    num_complete_tasks = complete_tasks.count.to_f
    @percentage_done = ((num_complete_tasks / num_all_tasks)*100).round

  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    project = Project.find params[:id]
    project.update project_params
    
    project.users.clear
    
    if project_user_params[:user_ids]
      users = User.find project_user_params[:user_ids]
      project.users << users
    end

    redirect_to project_path params[:id]
  end

  def destroy
    Project.destroy params[:id]
    redirect_to projects_path
  end

  private

  def project_params
    params
      .require(:project)
        .permit(:title, :description, :due_date, :priority, :progress, tasks_attributes: [:title])
  end 

  def project_user_params
  params.require(:project).permit(:user_ids => [])
  end



end
