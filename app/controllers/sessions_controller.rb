class SessionsController < ApplicationController

  def new
  end

  def create
    #first try and find the user by email in the db
    @user = User.find_by_email(params[:login][:email])
    #if the user exists AND they put in the right password:
    if @user && @user.authenticate(params[:login][:password])
      #generate a cookie for the user
      #redirect them somewhere
      session[:current_user_id] = @user.id
      redirect_to posts_path
    else
      #redirect them back to the login page
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out!"
  end

end
