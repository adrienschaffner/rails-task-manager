class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  # read one
  def show
    @task = Task.find(params[:id])
  end

  # create : GET the task creation
  def new
    @task = Task.new # needed to instantiate the form_for
  end

  # create : POST the form
  def create
    @task = Task.new(params[:task])
    @task.save
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to(@task.id)
  end

  # update in 2 steps
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params[:task])
    @task.save
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    render :index
    redirect_to task_path(@task)

    # no need for app/views/restaurants/destroy.html.erb
    # redirect_to task_path(@task.id)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
