class UsersController < ApplicationController

	before_action :current_user

  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	# Set the user role to 'user'
  	@user.role = 'user'

  	if @user.save
  		flash[:success] = "You've registered successfully!"
  		# Log the user in
  		session[:user_id] = @user.id
  		redirect_to user_path(@user.id)
  	else
  		flash[:error].now = "Oh snap! Something went wrong with your registration."
  		render :new
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end

end