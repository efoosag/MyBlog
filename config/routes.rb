Rails.application.routes.draw do
  
  resources :posts, only: [:index, :show]
  resources :users, only: [:index, :show]
  root 'home#index'
  
end
