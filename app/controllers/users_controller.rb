class UsersController < ApplicationController

	before_action :require_user, except: [:new, :create]
	before_action :set_user, except: [:new, :create]

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
  		flash.now[:error] = "Oh snap!  Something went wrong with your registration."
  		render action: "new"
  	end
  end

  def edit
  end

  def update
  	if @user.update(user_params)
  		flash[:success] = "Your profile was updated!"
  		redirect_to user_path(@user)
  	else
  		flash.now[:error] = "Oh snap!  Something went wrong updating your profile."
  		render :edit
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end

  def set_user
  	@user = current_user
  end

end