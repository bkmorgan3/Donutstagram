class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.where(email: params[:login][:email]).first
    if @user && @user.authenticate(params[:login][:password])
      #set a cookie so our browser knows
      #we are who we say we are/
      session[:user_id] = @user.id.to_s
      redirect_to posts_path
    else
      #give them another shot at logging in
      # perhaps redirecting to the login form
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out!"
  end

end
