Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :tasks
  resource :user_profiles
  root to: 'tasks#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users do
    resource :user_profile, only: [:new, :create, :edit, :update]
  end
  
end