Pollse::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root :to  => 'static_pages#index'

  match 'about' => 'static_pages#about'
  match 'terms' => 'static_pages#terms'
  match 'privacy' => 'static_pages#privacy'

  resources :point_transactions

  resources :category_assignments

  resources :categories

  resources :polls do
    resources :responses, :only => [:create, :update]
  end

  resources :questions

  resources :users

  devise_for :users, :path => 'account'
end
