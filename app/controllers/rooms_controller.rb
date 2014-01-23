class RoomsController < ApplicationController

  def index
  	# @rooms = Room.near("London")
  	@rooms = Room.all
  end

  def show
  	@room = Room.find(params[:id])
  end

  def new
  	@room = Room.new
  end

  def create
  	@room = Room.new(room_params)
  	if 
  		@room.save
  			flash[:success] = "You have added your room"
  			redirect_to room_path(@room)
  	else
  		render "new"
  	end
  end

  def edit
  	@room = Room.find(params[:id])
  end

  def update
	@room = Room.find(params[:id])	
	if @room.update(room_params)
		flash[:success] = "Your room has been updated"
		redirect_to room_path(@room)
	else
		render "edit"

	end

  end

  def destroy
  	@room = Room.find(params[:id])
  	@room.destroy
  	flash[:success] = "Your room has been deleted"
		redirect_to root_path

  end

  private
  def room_params
  	# shortcut for white listing form data, this is private so we can say on the form we can update certain fields
  	params.require(:room).permit(:title, :address, :description, :max_guests, :bedrooms, :price)
  end
end
