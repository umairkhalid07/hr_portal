Rails.application.routes.draw do

  devise_for :users
  root "positions#index"

  resources :positions do
    resources :candidates
  end
end
