# app/controllers/tasks_controller.rb

class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @new_task = Task.new
  end

  def create
    @new_task = Task.new(task_params)

if @new_task.save
  redirect_to tasks_path, notice: 'タスクが作成されました。'
else
  Rails.logger.debug @new_task.errors.full_messages
  @tasks = Task.all
  render :index
end
end
  

  private

  def task_params
    params.require(:task).permit(:title, :description, :start_time, :end_time)
  end
end

