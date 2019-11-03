class TagsController < ApplicationController
  def index
    @tags = Tag.order(:id).all
  end

  def show
    @tag = Tag.find params[:id]
  end

  def new
    @tag = Tag.new
  end

  def edit
    @tag = Tag.find params[:id]
  end

  def destroy
    tag = Tag.find params[:id]
    tag.destroy
    redirect_to tags_path, notice: "Tag '#{tag.name}' deleted"
  end

  def create
    @tag = Tag.new tag_params
    if @tag.save
      redirect_to tags_path, notice: "Tag '#{@tag.name}' has been added"
    else
      render "new"
    end
  end

  def update
    @tag = Tag.find params[:id]
    if @tag.update tag_params
      redirect_to tags_path, notice: "Tag '#{@tag.name}' has been updated"
    else
      render "edit"
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
