Onboard::Application.routes.draw do


# sign up users to the site
resources :users

# connect urls with the controller
# orders are inside rooms as we want to place an order on a room
resources :rooms do
	resources :orders, only: [:new, :create]
end

# my list of orders dont have to be on a room
resources :orders, only: [:index, :show]

# login and logout of site
# it is a singular resource as we can only do one session
resource :session

# homepage
root "rooms#index"



end
