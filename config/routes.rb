Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :tasks
  resources :users do
    resource :user_profile
  end  
  root to: 'tasks#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  
end