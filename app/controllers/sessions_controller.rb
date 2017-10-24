class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #set a cookie so our browser knows
      #we are who we say we are/
      session[:user_id] = user.id

      redirect_to posts_path, flash: {success: "You have successfully logged in."}
    else
      #give them another shot at logging in
      # perhaps redirecting to the login form
      flash.now[:danger] = "There was something wrong with your login information"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

end
