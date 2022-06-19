# frozen_string_literal: true

Rails.application.routes.draw do
  resources :classroms
  post '/login', to: 'sessions#login'
  post '/signup', to: 'sessions#signup'

  resources :modalities
  resources :users
end
