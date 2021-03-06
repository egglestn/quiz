Rails.application.routes.draw do
  resources :answers, only: []
  resources :contents
  resources :dashboard, only: :show
  resources :users, only: [:index, :edit, :update]
  devise_for :users

  authenticated :user do
    root to: 'dashboard#show'
  end

  root to: redirect('/users/sign_in')
end
