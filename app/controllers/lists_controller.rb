class ListsController < ApplicationController
  def new
    @list = List.new
    @project_id = params[:project_id]
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      redirect_to list_path(@list)
    else
      redirect_to new_list_path, :alert => "A todo list must have a name."
    end
  end

  def show
    @list = List.find(params[:id])
    @task = Task.new
  end

  def index
  end
end
