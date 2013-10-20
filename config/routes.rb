Pollse::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root :to  => 'static_pages#index'

  match 'about' => 'static_pages#about'
  match 'terms' => 'static_pages#terms'
  match 'privacy' => 'static_pages#privacy'

  resources :polls, :except => [:edit, :update, :destroy] do
    get :next, :on => :collection
    member do
      post :activate
      post :deactivate
    end
    resources :responses, :only => :create
  end
  
  resources :offers, :only => [:index, :show] do
    post :buy, :on => :member
  end

  resources :users

  devise_for :users, :path => 'account'
end
