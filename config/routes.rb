Rails.application.routes.draw do
  resources :provinces
  post 'disable_province', to: 'provinces#disable', as: 'disable_province'
end
