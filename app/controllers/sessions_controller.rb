class SessionsController < ApplicationController

  def new
  end

  def create
    #first try and find the user by username in the db
    #@user = User.find_by_username([:login][:username])
    #if the user exists AND they put in the right password:
    #if @user && @user.authenticate
  end

  def destroy
  end

end
