class HomeController < ApplicationController
  def index
  end

  def about
    @posts = Post.chronological
  end

  def help
  end

end
