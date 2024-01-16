# app/controllers/tasks_controller.rb

class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @new_task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id  # ログイン中のユーザーのIDをセット
  
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end
  

  private

  def task_params
    params.require(:task).permit(:title, :description, :start_time, :end_time)
  end
end

