Rails.application.routes.draw do

  devise_for :users
  
  authenticated :user do
   root :to => "home#show"
  end
  
  root to: 'startpage#show'

  resources :details
  resources :orders
  resources :notifications, only: [:destroy]
  resources :home , only: [:show]
end