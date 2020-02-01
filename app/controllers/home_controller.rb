class HomeController < ApplicationController
  layout 'main'

  def index
    @release_posts = Post.paginate(page: params[:page], per_page: 10).order('release_date DESC')
  end

  def post
    @post ||= Post.find_by(permalink: params[:permalink])
    if @post.present?
      @comment = Comment.new
    end
  end

  def post_comment
    @comment = Comment.new comment_params
    @post = @comment.post
    if verify_recaptcha(model: @comment) && @comment.save
      redirect_to post_by_permalink_path(@comment.post.permalink), notice: "a comment for Post:'#{@comment.post.title}' has created"
    else
      unless verify_recaptcha
        flash[:recaptcha_error] = 'reCAPTCHA verification failed'
      end
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
