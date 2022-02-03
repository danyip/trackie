class TasksController < ApplicationController
  
  before_action :check_if_logged_in

  def new
    @task = Task.new
  end

  def create

    @task = Task.create task_params

    if @task.persisted?
      @task.update_task_status
      redirect_to task_path @task.id #redirect to the home page 

    else # if create was unsuscessful, go back to the form

      render :new
    
    end

  end

  def index
    @tasks = Task.order "priority"
  end

  def show
    @task = Task.find params[:id]
  end

  def edit
    @task = Task.find params[:id]

    redirect_to root_path unless @task.user_id == @current_user.id || @task.project.user_id == @current_user.id

  end

  def update

    @task = Task.find params[:id]

    if @task.user_id != @current_user.id || @task.project.user_id == @current_user.id
      redirect_to login_path
      return 
    end 

    if @task.update task_params # if the task update is sucessful
        @task.update_task_status # check and update the status
      redirect_to task_path @task # redirect to the task
    else #if update unsucessful
      render :edit # back to the edit page
    end 

  end

  def destroy
    task = Task.find params[:id] # readability
    parent = Project.find task.project_id # readability

    Task.destroy task.id
    redirect_to project_path(parent.id) 
  end

  private

  def task_params
    params
      .require(:task)
        .permit(:title, :description, :due_date, :status, :priority, :project_id, :user_id)
  end 


end