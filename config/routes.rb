Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#index', as: 'about'
  
  resources :books 
  
  resources :homes, only: [:index]
  

  resources :users, only: [:show, :edit, :index, :update]
  
end 
