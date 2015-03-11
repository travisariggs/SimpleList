class WelcomeController < ApplicationController

  def index
    # flash[:success] = "Test success!"
    # flash[:info] = "Test Info!"
    # flash[:warning] = "Test warning!"
    # flash[:error] = "Test danger!"
    if logged_in?
    	redirect_to user_items_path(current_user)
    end
    
  end

end