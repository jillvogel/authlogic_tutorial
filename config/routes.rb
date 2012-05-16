UserActivation::Application.routes.draw do

  # session management
  resources :user_sessions
  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout

  # user management
  resources :users  # give us our some normal resource routes for users
  resource :user, :as => 'account'  # a convenience route
  match 'signup' => 'users#new', :as => :signup

  root :to => 'users#new'
end
