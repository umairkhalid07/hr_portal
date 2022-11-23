Rails.application.routes.draw do

  devise_for :users
  root "positions#index"

  resources :positions
  resources :candidates

end
