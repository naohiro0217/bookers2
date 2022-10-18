Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  patch 'books/:id' => 'books#update', as: 'update_book'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  resources :users, only: [:show, :index, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
