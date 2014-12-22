Rails.application.routes.draw do
  root 'welcome#index'

  resources :band_names
end
