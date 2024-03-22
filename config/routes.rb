Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  root 'static_pages#home'

  resources :restaurants

  resources :users do 
    resources :avatars, only: [:create]
  end
  
  resources :admins, only: [:show, :index, :create, :edit, :update, :destroy] do 
    resources :images, only: [:create]
  end

 

  get '/home', to: 'static_pages#home'
  get '/concept', to: 'static_pages#concept'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'




  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
