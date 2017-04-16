Rails.application.routes.draw do
  resources :answers
  resources :contents
  devise_for :users

  root to: "contents#index"
end
