class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:id).all
  end

  def show
    @category = Category.find params[:id]
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find params[:id]
  end

  def destroy
    category = Category.find params[:id]
    category.destroy
    redirect_to categories_path, notice: "Category '#{category.name}' deleted"
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to categories_path, notice: "Category '#{@category.name}' has been added."
    else
      render "new"
    end
  end

  def update
    @category = Category.find params[:id]
    if @category.update category_params
      redirect_to categories_path, notice: "Category '#{@category.name}' has been updated."
    else
      render "edit"
    end
  end


  private
  
  def category_params
    params.require(:category).permit(:name)
  end
end
