class PostsController < ApplicationController

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
        p params[:post][:image]
        render 'new'
    end
 end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
