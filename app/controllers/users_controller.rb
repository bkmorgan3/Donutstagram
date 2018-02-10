class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  #to authorize to see user without being loggged in
  #before_action :authorize
    def index
      @users = User.paginate(page: params[:page], per_page: 4)
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      @user.email.downcase!
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Account created succesfully, #{@user.username}"
        redirect_to posts_path
      else
        flash[:danger] = "Ooops, couldnt create account.  Make sure youre using  valid email and password."
        render "new"
      end
    end

    def edit
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "Your account was updated successfully."
        redirect_to posts_path
      else
        render 'edit'
      end
    end

    def show
      @user = User.find(params[:id])
      @user_posts = @user.posts.paginate(page: params[:page], per_page: 4)
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:danger] = "User and all posts have been deleted."
      redirect_to users_path
    end


    private

    def require_admin
      if logged_in? and !current_user.admin?
        flash[:danger] = "Only admin users can perform that action."
        redirect_to root_path
      end
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
      if current_user != @user and !current_user.admin?
        flash[:danger] = "You can only edit your own account"
        redirect_to root_path
      end
    end

  end
