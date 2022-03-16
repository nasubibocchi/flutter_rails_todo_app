Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/isDone', to: 'todos#isDone'
  get '/body', to: 'todos#body'
  root "todos#index"
end
