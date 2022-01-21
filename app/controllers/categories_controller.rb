class CategoriesController < ApplicationController
    def index
      categories = Category.all
      render json: categories
    end

    def create
      category = Category.create(category_params)
      if category.errors[:title].any?
        render json: {status: "error", code: 4000, message: category.errors.objects.first.full_message}, status: :unprocessable_entity
      else
        render json: category
      end
    end

    def update
      category = Category.find(params[:id])
      category.update(category_params)
      if category.errors[:title].any?
        render json: {status: "error", code: 4000, message: category.errors.objects.first.full_message}, status: :unprocessable_entity
      else
        render json: category
      end
    end

    def destroy
        Category.destroy(params[:id])
    end

    private
    def category_params
      params.require(:category).permit(:title)
    end
  end
  