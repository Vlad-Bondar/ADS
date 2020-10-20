# frozen_string_literal: true

class CategoriesController < ApplicationController
  def new; end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to posts_path
    else
      render new_category_path
    end
  end

  private

  def category_params
    params.permit(:title)
  end
end
