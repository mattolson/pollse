Pollse::Application.routes.draw do

  root :to  => 'static_pages#index'

  match 'about' => 'static_pages#about'
  match 'terms' => 'static_pages#terms'
  match 'privacy' => 'static_pages#privacy'

  resources :point_transactions

  resources :category_assignments

  resources :categories

  resources :responses

  resources :polls

  resources :questions

  devise_for :users
end
