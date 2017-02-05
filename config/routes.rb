Rails.application.routes.draw do
  resources :contents
  devise_for :users
  resources :questions
  resources :answers
  resources :contents

end
