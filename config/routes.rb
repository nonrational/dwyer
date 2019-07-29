Rails.application.routes.draw do
  devise_for :users

  root 'band_names#index'

  resources :band_names
end
