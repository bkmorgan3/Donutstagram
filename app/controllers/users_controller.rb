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
      @user.email.downcase!
      if @user.save
        flash[:notice] = "Account crated succesfully"
        redirect_to login_path
      else
        flash[:notice] = "Ooops, couldnt create account.  Make sure youre using  valid email and password."
        render :new
      end
    end


    def show
      @user = User.find(params[:id])
    end

    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
#    current_user = User.find_by_id(session[:current_user_id])
