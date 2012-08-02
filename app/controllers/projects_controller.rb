class ProjectsController < ApplicationController
  before_filter :require_login

  def new
    @project = Project.new
  end

  def edit

  end

  def destroy
  end

  def update
  end

  def index
    @projects = Project.where(current_user.id)
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:success] = "Success!"
      redirect_to project_path(@project)
    else
      redirect_to new_project_path, :alert => "Project must have a title, and public status."
    end
  end

  private

  def require_login
    redirect_to new_user_session_path unless current_user
  end

end
