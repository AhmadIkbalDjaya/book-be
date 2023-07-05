Rails.application.routes.draw do
  get 'book', to: 'books#index'
  post 'book', to: 'books#store'
  get 'book/:id', to: 'books#show'
  put 'book/:id', to: 'books#update'
  delete 'book/:id', to: 'books#destroy'
  # namespace :api do
  #   get 'book', to: 'books#index'
  #   post 'book', to: 'books#store'
  # end
  # get 'book', to: 'api/books#index'
  # get 'article/'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
