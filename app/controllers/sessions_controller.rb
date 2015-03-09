class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:user])
    if user and user.authenticate(params[:password])
      flash[:success] = "Welcome back #{user.name}!"
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Something was wrong with your username or password"
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end