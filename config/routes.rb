Rails.application.routes.draw do
  resources :contents
  devise_for :users

  root to: "contents#index"
end
