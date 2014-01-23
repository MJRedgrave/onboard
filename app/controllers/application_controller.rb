class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # the application controller deals with all our other controllers like a boss

  # new shortcut for current_user
  def current_user
  	if session[:user_id].present?
  		User.find(session[:user_id])
  	end
  end

  #  make the shortcut above availible in our views as well as our controllers
  helper_method :current_user
end
