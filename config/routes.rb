Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  
  post 'books' => 'books#create'
  
  resources :books, only: [:create, :index, :show, :update, :destroy, :edit]
  
  resources :homes, only: [:index]
  
end
