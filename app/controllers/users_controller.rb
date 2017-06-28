class UsersController < ApplicationController

  def index
    @users = User.all
    current_user = User.find_by_id(session[:current_user_id])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
    session[:user_id] = @user.idto_s
      redirect_to users_path
    else
      redirect_to new_user_path
  end
end

  def update
  end


  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end


end
