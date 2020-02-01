class CommentsController < ApplicationController
  layout 'mainadmin'
  before_action :authenticate_user!, :set_paper_trail_whodunnit
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @comments = Comment.paginate(page: params[:page], per_page: 10).order('id ASC')
  end

  def show
    @comment = current_comment
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = current_comment
  end

  def destroy
    comment = current_comment
    comment.destroy
    redirect_to comments_path, notice: "Comment id:#{comment.id} for Post:'#{comment.post.title}' has deleted"
  end

  def create
    @comment = Comment.new comment_params
    if @comment.save
      redirect_to comment_path(@comment), notice: "Comment id:#{@comment.id} for Post:'#{@comment.post.title}' has created"
    else
      render 'new'
    end
  end


  def update
    @comment = current_comment
    if @comment.update comment_params
      redirect_to comment_path(@comment), notice: "Comment id:#{@comment.id} for Post:'#{@comment.post.title}' has updated"
    else
      render 'edit'
    end
  end

  def audit_trail
    comment = current_comment
    @audit_trail = ApplicationHelper::AuditTrail.to_model comment.versions
    render 'shared/audit_trail'
  end

  private

  def current_comment
    @current_comment ||= Comment.find params[:id]
  end

  def comment_params
    params.require(:comment).permit(:name, :email, :content, :post_id)
  end

  def record_not_found
    redirect_to comments_path, notice: 'Comments not found'
  end
end