Rails.application.routes.draw do
  resources :locations
  resources :location_lists
  resources :profiles
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'profiles#show'
  # root 'profiles#current_user_show'
end
