Rails.application.routes.draw do 
  root 'households#show'

  get '/signup', to: 'households#new'
  # post '/signup', to: 'household#create' 

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
  
  # custom routes go above this line
  resources :member_chores

  resources :chores do
    resources :members
  end

  resources :members do 
    resources :chores, only: [:new, :create, :index]
    #/members/:member_id/chores
  end 

  resources :households do 
    resources :members
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
