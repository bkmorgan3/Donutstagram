class PostsController < ApplicationController

#before_action :authorize, only: [:new, :index]

  def index
    @posts = Post.order('created_at DESC')

  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    p params.inspect
    @post = Post.new(post_params)
    @post.user = User.first
      if @post.save
        redirect_to posts_path
      else
        p @post.error
        p params[:post][:image]
        render 'new'
    end
 end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
    p params
    @post = Post.find(params[:id])
    if @post.delete
      redirect_to posts_path
    else
      redirect_to edit_post_path

    end
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
