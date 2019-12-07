class HomeController < ApplicationController
  layout 'main'

  def index
    @all_release_post = Post.all_release
  end

  def post
    @post = Post.find_by(permalink: params[:permalink])
  end

  def about
  end
end
