class HomeController < ApplicationController
  def index
    @all_release_post = Post.all_release
  end
end