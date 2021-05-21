# frozen_string_literal: true

Rails.application.routes.draw do
  root 'categories#index'
  get 'users/signup', to: 'users#new'
  get 'users/signin', to: 'users#signin'
  post 'users/signin', to: 'users#start_user_session'
  get 'users/logout', to: 'users#end_user_session'

  resources :users, except: [:new]
  resources :categories, only: %i[index show]
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
