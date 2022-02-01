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
      
      redirect_to project_path @project.id # redirect to the new project

    else # if the project creation was unsucessful

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
    
    if @project.update project_params #If the update is sucessful
      
      @project.tasks.each do |task| # Run the update_task_status method on each task in the project
        task.update_task_status
      end #end do

      redirect_to project_path params[:id] # Redirect to the project

    else # if the update was unsucessful
      render :edit #go back to the edit
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
        .permit(:title, :description, :due_date, :priority, :user_id, tasks_attributes: [:title, :description, :due_date, :status, :priority, :project_id, :user_id])
  end 

end # ProjectsController
