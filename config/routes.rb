Rails.application.routes.draw do
  resources :diver_reviews
  resources :location_reviews
  resources :locations
  resources :location_lists
  resources :profiles
  devise_for :users
  resources :chat_rooms, only: [:new, :create, :show, :index]
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'locations#index'
  # root 'profiles#current_user_show'
end
