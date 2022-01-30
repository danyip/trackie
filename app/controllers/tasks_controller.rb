class TasksController < ApplicationController
  def new
  end

  def create
  end

  def index
    @tasks = Task.order "priority"
  end

  def show
    @task = Task.find params[:id]
    @project = @task.project
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    task = Task.find params[:id]
    task.update task_params
    redirect_to task_path params[:id]
  end

  def destroy
    task = Task.find params[:id]
    parent = Project.find task.project_id
    Task.destroy task.id
    redirect_to project_path(parent.id) 
  end

  private

  def task_params
    params
      .require(:task)
        .permit(:title, :description, :due_date, :status, :priority, :duration, :project_id, :user_id)
  end 


end