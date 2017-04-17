Rails.application.routes.draw do
  resources :answers
  resources :contents
  resources :dashboard, only: :show
  devise_for :users

  authenticated :user do
    root to: "dashboard#show"
  end

  root to: redirect("/users/sign_in")
end
