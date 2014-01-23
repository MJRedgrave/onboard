class SessionsController < ApplicationController

	# sessions are the way the browser tracks me, we want to manage them in our app
	# sessions controller deals with this stuff

	def destroy
		# logout
		reset_session
		flash[:sucess] = "you have logged out"
		redirect_to root_path
	end

	def new
		# login form
	end

	def create
		#  do the login

		# I want to find the username and password typed in
		@username = params[:session][:username]
		@password = params[:session][:password]
		# then I want to see if theres a user with that username
		@user = User.find_by_username(@username)

		# if there is check their password as well
		if 
			@user.present? and @user.authenticate(@password)

		# if it matches give them the session
			session[:user_id] = @user.id
			flash[:sucess] = "You have logged in"
			redirect_to root_path
		else
		# if not show the new page
			flash[:error] = "wrong username/password"
			render "new"
		end



	end
end
