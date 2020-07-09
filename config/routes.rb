Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:new, :create, :update, :show, :index, :edit]
  resources :books, :only => [:new, :create, :update,:show, :index, :edit, :destroy]
  root 'homes#top'
  get '/home/about' => 'homes#about'
  #post 'users' => 'books#create'
  #patch 'users/:id' => 'users#update', as: 'update_user'
  #patch 'books/:id' => 'books#update', as: 'update_book'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
