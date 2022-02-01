class ProjectsController < ApplicationController
  
  # before_action :check_if_logged_in

  def new
    @project = Project.new 
    @project.tasks.build # this is for the nested task creation
  end

  def create
    @project = Project.create project_params

    if @project.persisted? # if the project creation was sucessful
      
      @project.tasks.each do |task| # Run the update_task_status method on each task in the project
        task.update_task_status
      end #end do
      

      if project_user_params[:user_ids] # if some users have been assigned to the project
        users = User.find project_user_params[:user_ids] # find them
        @project.users << users # and push them into the projects_users table
      else
        @project.users << @current_user # otherwise just push the current user
      end # if-else user assignment

      redirect_to project_path @project.id # redirect to the new project

    else # if the proejct creation was unsucessful

      render :new # go back to the new form

    end # if-else project.persisted?
  end

  def index
    @projects = Project.order "priority"
  end

  def show

    @project = Project.find params[:id]

    @percentage_done = @project.calc_project_completion unless @project.tasks.count == 0

  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    @project = Project.find params[:id]
    
    if @project.update project_params

      @project.tasks.each do |task| # Run the update_task_status method on each task in the project
        task.update_task_status
      end #end do

      # @project.users.clear
    
      # if project_user_params[:user_ids]
      #   users = User.find project_user_params[:user_ids]
      #   @project.users << users
      #   redirect_to project_path params[:id]
      # else
      #   @project.users << @current_user
      #   redirect_to project_path params[:id]
      # end

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

  # def project_user_params
  #   params.require(:project).permit(:user_ids => [])
  # end



end
