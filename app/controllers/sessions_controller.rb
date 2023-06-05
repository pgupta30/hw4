class SessionsController < ApplicationController
  def new
  end

  def create
  
  @user = User.find_by({"email" => params["email"]})
    
  if @user
      password_the_user_typed = params["password"]
      password_in_the_database = @user["password"]
      if BCrypt::Password.new(password_in_the_database) == password_the_user_typed
        
        redirect_to "/places"
    
      else
        
        redirect_to "sessions/new"
    
      end
  
  end

  def destroy
  end