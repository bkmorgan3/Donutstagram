class PostsController < ApplicationController
  before_action :set_donut, only: [:edit, :destroy, :update, :show]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 4)

  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new

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
    redirect_to posts_path, flash: {:danger => "Post was successfully deleted."}
  end

  private
  def set_donut
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def require_same_user
    if current_user != @post.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own posts."
      redirect_to posts_path
    end
  end

end
