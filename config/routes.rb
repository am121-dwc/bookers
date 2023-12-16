Rails.application.routes.draw do
  get '/books', to: 'books#index', as: 'books'
  root 'homes#top'
  get 'books/new'
  get 'books/index'
  get 'books/:id' => 'books#show'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as:'update_book'
  get '/' => 'homes#top'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
