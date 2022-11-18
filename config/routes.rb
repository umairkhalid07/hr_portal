Rails.application.routes.draw do
  root "positions#index"

  resources :positions do
    resources :candidates
  end
end
