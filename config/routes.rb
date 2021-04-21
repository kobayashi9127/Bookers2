Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  
  resources :books 
  
  resources :homes, only: [:index]
  

  resources :users, only: [:show, :edit, :index, :update]
  
end 
