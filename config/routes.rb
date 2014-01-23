Onboard::Application.routes.draw do

# sign up users to the site
resources :users

# connect urls with the controller
resources :rooms

# login and logout of site
# it is a singular resource as we can only do one session
resource :session

# homepage
root "rooms#index"



end
