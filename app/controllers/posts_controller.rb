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
    @post = Post.new(post_params)
    @post.user = User.last
      if @post.save
        redirect_to posts_path
      else
        render 'new'
    end
 end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.caption = params[:post][:caption]
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
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
