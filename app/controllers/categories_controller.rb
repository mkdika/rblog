class CategoriesController < ApplicationController
  layout 'mainadmin'
  before_action :authenticate_user!, :set_paper_trail_whodunnit
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @categories = Category.order(:id).all
  end

  def show
    @category = current_category
  end

  def new
    @category = Category.new
  end

  def edit
    @category = current_category
  end

  def destroy
    category = current_category
    category.destroy
    redirect_to categories_path, notice: "Category '#{category.name}' deleted"
  end
  
  def create
    @category = Category.new category_params
    if @category.save
      redirect_to category_path(@category), notice: "Category '#{@category.name}' has been added"
    else
      render 'new'
    end
  end

  def update
    @category = current_category
    if @category.update category_params
      redirect_to category_path(@category), notice: "Category '#{@category.name}' has been updated"
    else
      render 'edit'
    end
  end

  def audit_trail
    category = current_category
    @audit_trail = ApplicationHelper::AuditTrail.to_model category.versions
    render 'shared/audit_trail'
  end

  private

  def current_category
    @current_category ||= Category.find params[:id]
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def record_not_found
    redirect_to categories_path, notice: 'Category not found'
  end
end
