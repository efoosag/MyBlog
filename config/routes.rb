Rails.application.routes.draw do
  
  resources :posts
  resources :users
  root 'home#index'
  
end
