class OrdersController < ApplicationController
  
# make sure users are logged in before making an order
before_action :make_sure_logged_in

  def index
    @orders = current_user.orders.all
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
  	#  find the room from our routes
  	@room = Room.find(params[:room_id])
  	# make an order on the room
  	@order = @room.orders.new
  	# populate the user
  	@order.user = current_user
  end

  def create
  	# submitted the form now save the order
  	@room = Room.find(params[:room_id])
  	# confirm the order on the room
  	@order = @room.orders.new(order_params)
  	# populate the user
  	@order.user = current_user
  	if @order.save

  		# we want to charge stripe with the token - .to_i wakes it a integer
  		Stripe::Charge.create(card: @order.stripe_token, 
  			description: "Room on onboard", 
  			amount: (@room.price * 100).to_i, currency: "gbp")

  		flash[:success] = "You have ordered this room"
  		redirect_to room_path(@room)
  	else
  		render "new"
  	end
  end

 private
 def order_params
 	params.require(:order).permit(:stripe_token)
 end

end
