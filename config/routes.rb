Onboard::Application.routes.draw do

# sign up users to the site
resources :users

# connect urls with the controller
resources :rooms

# homepage
root "rooms#index"



end
