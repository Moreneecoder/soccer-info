# frozen_string_literal: true

Rails.application.routes.draw do
  root 'categories#index'
  get 'users/signup', to: 'users#new'
  get 'users/signin', to: 'users#signin'
  post 'users/signin', to: 'users#start_user_session'
  get 'users/logout', to: 'users#end_user_session'
  get 'writer_of_the_week', to: 'users#writer_of_the_week'
  get 'upvote/:id', to: 'votes#upvote'

  resources :users, except: [:new]
  resources :categories, only: %i[index show new create edit update]
  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
