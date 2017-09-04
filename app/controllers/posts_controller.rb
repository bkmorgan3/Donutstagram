class PostsController < ApplicationController
  before_action :set_donut, only: [:edit, :destroy, :update, :show]


  def index
    @posts = Post.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def show

  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
      if @post.save
        flash[:success] = "Your post was successfully created."
        redirect_to posts_path
      else
        render 'new'
      end
   end

  def edit

  end

  def update
    @post.caption = params[:post][:caption]
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:danger] = "Post was successfully deleted."
    redirect_to posts_path
  end

  private
  def set_donut
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
