class TasksController < ApplicationController
    def index
      tasks = Task.all
      priorities = Task.priorities
      recurrences = Task.recurrences
      render json: { tasks: tasks, priorities: priorities.keys, recurrences: recurrences.keys }
    end

    def search
      tasks = Task.all.where("title = ? and category_id = ?", params[:search], params[:id])
      render json: tasks
    end

    def sort
      tasks = Task.all.order(params[:search])
      render json: tasks
    end

    def create
      task = Task.create(task_params)
      render json: task
    end

    def update
      task = Task.find(params[:id])
      task.update(task_params)
      render json: task
    end

    def destroy
      Task.destroy(params[:id])
    end

    private
    def task_params
      params.require(:task).permit(:title, :category_id, :recurrence, :priority)
    end
  end
  