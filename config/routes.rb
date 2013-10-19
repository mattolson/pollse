Pollse::Application.routes.draw do
  resources :category_assignments


  resources :categories


  resources :responses


  resources :polls


  resources :question_options


  resources :questions

  devise_for :users

end
