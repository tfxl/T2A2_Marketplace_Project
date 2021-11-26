Rails.application.routes.draw do

  root to: "pages#index"

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/inbox', to: 'pages#inbox', as: 'inbox'

  #################### BOARDS ###############################

  get '/boards', to: 'boards#index', as: 'boards'
  post '/boards', to: 'boards#create'

  get '/boards/new', to: 'boards#new', as: 'new_board'

  get '/boards/:id', to: 'boards#show', as: 'board'
  delete '/boards/:id', to: 'boards#destroy'
  patch '/boards/:id', to: 'boards#update'
  
  get '/boards/:id/edit', to: 'boards#edit', as: 'edit_board'
  
  

#################### LISTINGS ###############################

  # TO LISTINGS
  get '/listings', to: 'listings#index', as: 'listings'
  post '/listings', to: 'listings#create'

  # NEW LISTING
  get '/listings/new', to: 'listings#new', as: 'new_listing'

  # SPECIFIC LISTING
  get '/listings/:id', to: 'listings#show', as: 'listing'
  patch '/listings/:id', to: 'listings#update'
  delete '/listings/:id', to: 'listings#destroy'

  # SPECIFIC LISTING + EDIT
  get '/listings/:id/edit', to: 'listings#edit', as: 'edit_listing'

  ##################### USER LISTINGS ###########################

  get '/my-listings', to: 'listings#my_listings', as: 'my_listings'
  get '/user-listings/:id', to: 'listings#see_user_listings', as: 'see_user_listings'

  #################### offers ###############################

  get '/offers', to: 'offers#index', as: 'offers'
  post '/offers', to: 'offers#create'

  get '/listings/:id/offer/new', to: 'offers#new', as: 'new_offer'

  get '/offers/:id', to: 'offers#show', as: 'offer'
  patch '/offers/:id', to: 'offers#update'
 
  delete '/offers/:id', to: 'offers#destroy'

  get '/offers/:id/edit', to: 'offers#edit', as: 'edit_offer'


  #################### ACCEPT REJECT ###############################

  get '/reject-offer/:id', to: 'offers#reject_offer', as: 'reject_offer'
  get '/accept-offer/:id', to: 'meetups#create', as: 'accept_offer'
  get '/reset-offer/:id', to: 'offers#reset_offer', as: 'reset_offer'

  #################### MEETUPS ###############################

  get '/meetups', to: 'meetups#index', as: 'meetups'
  get '/meetups/new', to: 'meetups#new', as: "new_meetup"
  post '/meetups', to: 'meetups#create'
  
  get '/meetups/:id/edit', to: 'meetups#edit', as: 'edit_meetup'

  get '/meetups/:id', to: 'meetups#show', as: 'meetup'
  patch '/meetups/:id', to: 'meetups#update'
  delete '/meetups/:id', to: 'meetups#destroy'

  ##################### USER CANCELLATIONS ###########################

  get '/meetups/swap-completed/:id', to: 'meetups#swap_completed', as: 'swap_completed'
  get '/meetups/host-cancellation/:id', to: 'meetups#host_cancels', as: 'host_cancellation'
  get '/meetups/cancellation/:id', to: 'meetups#responder_cancels', as: 'responder_cancellation'
  
end

