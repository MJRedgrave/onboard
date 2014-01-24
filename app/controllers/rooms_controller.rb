class RoomsController < ApplicationController

  # before quite a few of the actions below make sure were are logged in
  before_action :make_sure_logged_in, except: [:index, :show]


  def index
  	# @rooms = Room.near("London")
  	@rooms = Room.all
  end

  def show
  	@room = Room.find(params[:id])
  end

  def new
  	@room = current_user.rooms.new
  end

  def create
  	@room = current_user.rooms.new(room_params)
  	if 
  		@room.save
  			flash[:success] = "You have added your room"
  			redirect_to room_path(@room)
  	else
  		render "new"
  	end
  end

  def edit
  	@room = current_user.rooms.find(params[:id])
  end

  def update
	@room = current_user.rooms.find(params[:id])	
	if @room.update(room_params)
		flash[:success] = "Your room has been updated"
		redirect_to room_path(@room)
	else
		render "edit"

	end

  end

  def destroy
  	@room = current_user.rooms.find(params[:id])
  	@room.destroy
  	flash[:success] = "Your room has been deleted"
		redirect_to root_path

  end

  private
  def room_params
  	# shortcut for white listing form data, this is private so we can say on the form we can update certain fields
  	params.require(:room).permit(:title, :address, :description, :max_guests, :bedrooms, :price, :image)
  end
end
