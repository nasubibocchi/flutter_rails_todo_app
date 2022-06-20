Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :todos, only: [:create, :update] do
    collection do
      get :all
    end
  end

  root "todos#all" end
