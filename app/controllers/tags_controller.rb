class TagsController < ApplicationController
  layout 'mainadmin'
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @tags = Tag.order(:id).all
  end

  def show
    @tag = current_tag
  end

  def new
    @tag = Tag.new
  end

  def edit
    @tag = current_tag
  end

  def destroy
    tag = current_tag
    tag.destroy
    redirect_to tags_path, notice: "Tag '#{tag.name}' deleted"
  end

  def create
    @tag = Tag.new tag_params
    if @tag.save
      redirect_to tag_path @tag, notice: "Tag '#{@tag.name}' has been added"
    else
      render "new"
    end
  end

  def update
    @tag = current_tag
    if @tag.update tag_params
      redirect_to tag_path @tag, notice: "Tag '#{@tag.name}' has been updated"
    else
      render "edit"
    end
  end

  private

  def current_tag
    @current_tag ||= Tag.find params[:id]
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

  def record_not_found
    redirect_to tags_path, notice: 'Tag not found'
  end
end
