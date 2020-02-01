class PostsController < ApplicationController
  layout 'mainadmin'

  before_action :authenticate_user!, :set_paper_trail_whodunnit
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @posts = Post.paginate(page: params[:page], per_page: 10).order('id ASC')
  end

  def show
    @post = current_post
  end

  def new
    @post = Post.new
  end

  def edit
    @post = current_post
  end

  def destroy
    post = current_post
    post.destroy
    redirect_to posts_path, notice: "Post '#{post.title}' has deleted"
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post), notice: "Post '#{@post.title}' has added"
    else
      render 'new'
    end
  end

  def update
    @post = current_post
    if @post.update post_params
      redirect_to post_path(@post), notice: "Post '#{@post.title}' has updated"
    else
      render 'edit'
    end
  end

  def audit_trail
    post = current_post
    @audit_trail = ApplicationHelper::AuditTrail.to_model post.versions
    render 'shared/audit_trail'
  end

  def comments
    @post = current_post
    render 'comments'
  end

  private

  def current_post
    @current_post ||= Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(
      :title,
      :content,
      :release,
      :release_date,
      :category_id,
      tag_ids: []
    )
  end

  def record_not_found
    redirect_to posts_path, notice: 'Post not found'
  end
end
