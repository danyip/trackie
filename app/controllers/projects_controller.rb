class ProjectsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @projects = Project.order "priority"
  end

  def show
    @project = Project.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
