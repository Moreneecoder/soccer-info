# frozen_string_literal: true

Rails.application.routes.draw do
  root 'categories#index'
  get 'users/signup', to: 'users#new'
  resources :users, except: [:new]
  resources :articles, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
