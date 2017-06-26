class UsersController < ApplicationController

  def index
    @users = User.all
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
    @user = User.new(set_user)
    if @user.save
      flash[:notice] = "Sign up was succesful."
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
  def set_user
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end


end
