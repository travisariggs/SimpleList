class ItemsController < ApplicationController

	before_action :require_user

	def index
		# Get items and sort them in descending priority
		@items = current_user.items.where(completed: false).order(priority: :desc)
		@completed_items = current_user.items.where(completed: true).limit(3).order(updated_at: :desc)
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
		@item.completed = false

		if @item.save
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

	def toggle_complete
		item = Item.find_by(id: params[:id], user_id: current_user.id)
		item.completed = params[:completed]

		if !item.save
			flash[:error] = "Snap! Something went wrong. Try it again..."
		end

		redirect_to user_items_path(current_user)
	end

	private

	def item_params
		params.require(:item).permit([:description, :priority, :due_date])
	end

end