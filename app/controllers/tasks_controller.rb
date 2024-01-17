# app/controllers/tasks_controller.rb

class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = current_user.tasks
    @total_duration_by_title = calculate_total_duration_by_title(@tasks)

    @new_task = Task.new
  end

  
  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  

  def create
    @new_task = current_user.tasks.build(task_params)

    if @new_task.save
      redirect_to tasks_path, notice: 'タスクが作成されました。'
    else
      @tasks = current_user.tasks
      @total_duration_by_title = current_user.tasks.group(:title).sum('end_time - start_time')
      render :index
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :start_time, :end_time)
  end

  def calculate_total_duration_by_title(tasks)
    total_duration_by_title = Hash.new(0)

    tasks.each do |task|
      total_duration_by_title[task.title] += task.duration
    end

    total_duration_by_title
end
end