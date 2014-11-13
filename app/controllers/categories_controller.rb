class CategoriesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to posts_path, flash: { notice: 'Your category has been created.' }
    else
      flash.now[:error] = @category.errors.full_messages
      render :new
    end
  end

  def show
    @category = Category.includes(:posts).find(params[:id])
    @posts = @category.posts.page(params[:page])
  end


  private

  def category_params
    params.require(:category).permit(:name, :title, :description, :sidebar, :submission_text)
  end
end
