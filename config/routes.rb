# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'presentations#index'

  resources :presentations, only: %i[index show new]
  get '/presentations', to: 'presentations#index'
  patch '/presentations/:id', to: 'presentations#update'
  post '/presentations', to: 'presentations#create_presentation'

  post '/feedbacks', to: 'presentations#create_feedback'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  get '/users', to: 'users#index'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_the_user'
  # patch "users/:id", to: "users#update"
end
