class TagsController < ApplicationController
  layout 'mainadmin'
  before_action :authenticate_user!, :set_paper_trail_whodunnit
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    current_user
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
    redirect_to tags_path, notice: "Tag '#{tag.name}' has deleted"
  end

  def create
    @tag = Tag.new tag_params
    if @tag.save
      redirect_to tag_path(@tag), notice: "Tag '#{@tag.name}' has added"
    else
      render "new"
    end
  end

  def update
    @tag = current_tag
    if @tag.update tag_params
      redirect_to tag_path(@tag), notice: "Tag '#{@tag.name}' has updated"
    else
      render "edit"
    end
  end

  def audit_trail
    tag = current_tag
    @audit_trail = ApplicationHelper::AuditTrail.to_model tag.versions
    render 'shared/audit_trail'
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
