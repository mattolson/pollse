Pollse::Application.routes.draw do

  root :to  => 'static_pages#index'

  resources :point_transactions

  resources :category_assignments

  resources :categories

  resources :responses

  resources :polls

  resources :questions, :except => [:destroy]

  devise_for :users

end
