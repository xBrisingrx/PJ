Rails.application.routes.draw do
  root "people#index"
  resources :people
  post 'disable_person', to: 'people#disable', as: 'disable_person'
  resources :institution_types
  resources :tables
  resources :institutions
  resources :neighborhoods
  resources :provinces
  post 'disable_province', to: 'provinces#disable', as: 'disable_province'
  resources :cities
  post 'disable_city', to: 'cities#disable', as: 'disable_city'
end
