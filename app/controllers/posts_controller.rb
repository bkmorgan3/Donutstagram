class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new({
      image: params[:post][:image],
      caption: params[:post][:caption]
      })
    if @post.save
      redirect_to posts_path
    else
      redirect_to posts_new_path
  end
end

  def edit
  end

  def update
  end

  def destroy
  end

end
