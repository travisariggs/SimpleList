class ItemsController < ApplicationController

	def index
	end

	def show
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)

		@user = current_user
		@item.user_id = @user.id

		if @item.save
			flash[:success] = "Your item was added to the list"
			redirect_to user_items_path(current_user)
		else
			flash[:error] = "Oh snap! We couldn't save your item."
			render :new
		end
	end

	def edit
	end

	def update
		if @item.update(item_params)
			flash[:info] = "Your item was updated"
			redirect_to user_items(current_user)
		else
			flash[:error] = "Shucks...we couldn't update your item."
			render :edit
		end
	end

	private

	def item_params
		params.require(:item).permit([:description, :priority, :due_date])
	end

end