Rails.application.routes.draw do
  root "positions#index"

  resources :positions
  resources :candidates

end
