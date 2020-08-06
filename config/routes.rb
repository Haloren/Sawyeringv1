Rails.application.routes.draw do
  resources :categories
  resources :member_chores
  resources :chores
  resources :members
  resources :households
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
