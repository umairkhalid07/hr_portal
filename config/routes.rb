Rails.application.routes.draw do

  devise_for :users
  root "positions#home"

  resources :positions
  resources :candidates

end
