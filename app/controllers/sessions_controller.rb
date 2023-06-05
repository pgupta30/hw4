class SessionsController < ApplicationController
  def new
    #render login form in sessions/new.html.erb
  end

  def create
    @user = User.find_by({"email" => params["email"]})
    if @user
      password_the_user_typed = params["password"]
      password_in_the_database = @user["password"]
      if BCrypt::Password.new(password_in_the_database) == password_the_user_typed
        flash["notice"] = "Yes!"
        redirect_to "/places"
      else
        flash["notice"] = "Nope."
        redirect_to "sessions/new"
      end

    else
    flash["notice"] = "Nope."
    redirect_to "/sessions/new"
    end
  end
end
    # @user = User.find_by({"email" => params["email"]})
    # if @user
    #   password_the_user_typed = params["password"]
    #   password_in_the_database = @user["password"]
    #   if BCrypt::Password.new(password_in_the_database) == password_the_user_typed
    #     flash["notice"] = "Yes!"
    #     redirect_to "/places"
    #   else
    #     flash["notice"] = "Nope."
    #     redirect_to "sessions/new"
    #   end
    # else
      # flash["notice"] = "Nope."
      # redirect_to "sessions/new"
  #   end
  # end