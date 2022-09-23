Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    # get "users", to: "devise/sessions#new"
    get "/users/sign_out", to: "devise/sessions#destroy"
  end

  devise_for :users
  get 'books/index'

  # get "books/:id", to: "books#show"

  resources :books do
    resources :copies
  end

  resources :copies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
