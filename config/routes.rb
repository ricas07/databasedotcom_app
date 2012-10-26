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

  #Routes for Self Service Pages
  namespace :self_service do
    match '', :action => 'login'
    get 'home'
    get 'solution'
    get 'submit'
    get 'view'
    get 'web_to_case'
  end
end