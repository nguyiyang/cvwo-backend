class TasksController < ApplicationController
    def index
      tasks = Task.all.where("category_id = ?", params[:category_id]).order("id")
      priorities = Task.priorities
      recurrences = Task.recurrences
      render json: { tasks: tasks, priorities: priorities.keys, recurrences: recurrences.keys }
    end

    def search
      tasks = Task.all.where("title = ? and category_id = ?", params[:search], params[:id])
      render json: tasks
    end

    def sort
      tasks = Task.all.where("category_id = ?", params[:id]).order(params[:search])
      render json: tasks
    end

    def create
      task = Task.new(task_params)
      if task.save
        render json: task
      else
        render json: {status: "error", code: 4000, message: task.errors.objects.first.full_message}, status: :unprocessable_entity
      end
    end

    def update
      task = Task.find(params[:id])
      task.update(task_params)
      if task.errors[:title].any?
        render json: {status: "error", code: 4000, message: task.errors.objects.first.full_message}, status: :unprocessable_entity
      else
        render json: task
      end
    end

    def destroy
      Task.destroy(params[:id])
    end

    private
    def task_params
      params.require(:task).permit(:title, :category_id, :recurrence, :priority)
    end
  end
  