Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  resources :admins

  devise_for :users
  resources :users
  resources :restaurants

  root 'static_pages#home'

  get '/home', to: 'static_pages#home'
  get '/concept', to: 'static_pages#concept'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'

  delete '/admin_logout', to: 'admins/sessions#destroy', as: :admin_logout

  get "up" => "rails/health#show", as: :rails_health_check
end
