Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'staticpages#top'
  resources :users, only: [:new, :create]
  resources :usages, only: [:new]
  resources :articles do
    resources :favorites, only: [:create, :destroy]
  end
  
  namespace :openai do
    get 'tests/', to: 'tests#generate_text'
    get 'tests/show', to: 'tests#show'
  end

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  delete 'logout' => 'user_sessions#destroy', :as => :logout
end
