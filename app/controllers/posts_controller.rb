class PostsController < ApplicationController
  load_and_authorize_resource except: [:create]

  def new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to about_path
    else
      render :new
    end
  end

  def update
    if @post.update post_params
      redirect_to about_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to :back
  end

  def edit
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
