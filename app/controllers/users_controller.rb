class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  #to authorize to see user without being loggged in
  #before_action :authorize
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      @user.email.downcase!
      if @user.save
        flash[:success] = "Account created succesfully, #{@user.username}"
        redirect_to posts_path
      else
        flash[:danger] = "Ooops, couldnt create account.  Make sure youre using  valid email and password."
        render "new"
      end
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
    end


    private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
      if logged_in? && current_user != @user
        flash[:danger] = "You can only edit your own account"
        redirect_to root_path
      end
    end

  end
