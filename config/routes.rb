Rails.application.routes.draw do 

  get '/signup', to: 'households#new'
  # post '/signup', to: 'household#create' 

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
  
  # custom routes go above this line
  resources :member_chores
  resources :chores
  resources :members
  resources :households
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
