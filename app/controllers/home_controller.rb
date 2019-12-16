class HomeController < ApplicationController
  layout 'main'

  def index
    @all_release_post = Post.all_release
  end

  def post
    @post = Post.find_by(permalink: params[:permalink])
    if @post.present?
      @comment = Comment.new
    end
  end

  def create_comment
    @comment = Comment.new comment_params
    if @comment.save
      redirect_to post_by_permalink_path(@comment.post.permalink), notice: "a comment for Post:'#{@comment.post.title}' has created"
    else
      @post = @comment.post
      render 'post'
    end
  end

  def about
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :content, :post_id)
  end
end
