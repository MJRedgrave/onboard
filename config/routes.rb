Onboard::Application.routes.draw do

  # connect urls with the controller
  resources :rooms

  # homepage
  root "rooms#index"



end
