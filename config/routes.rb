Rails.application.routes.draw do
  root 'band_names#index'

  resources :band_names
end
