class UsersController < ApplicationController
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
      if @user.save
        session[:user_id] = @user.id.to_s
        redirect_to posts_path
      else
        render :new
      end
    end


    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
#    current_user = User.find_by_id(session[:current_user_id])
