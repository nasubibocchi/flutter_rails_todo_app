Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/isDone', to: 'todos#isDone'
  # get '/body', to: 'todos#body'
  # resources :todos

  get "/todos", to: "todos#index"
  # get "/todos/:id", to: "todos#show"

  resources :todos, only: [] do
    collection do
      get :all
      post :create
    end
  end

  root "todos#index" end
