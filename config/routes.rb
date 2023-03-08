Rails.application.routes.draw do
  resources :provinces
  post 'disable_province', to: 'provinces#disable', as: 'disable_province'
  resources :cities
  post 'disable_city', to: 'cities#disable', as: 'disable_city'
end
