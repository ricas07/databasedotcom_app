SampleApp::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  #Salesforce Objects
  resources :marketing_strategy__cs
  resources :venue__cs
  resources :opportunities
  resources :accounts
  resources :tasks

  root to: 'static_pages#home'

  match '/signup', to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  #For Salesforce Self Service Portal Login
  match '/self_service', to: 'static_pages#self_service'
end