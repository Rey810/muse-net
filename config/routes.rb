Rails.application.routes.draw do
  get 'friendship_requests/create'
  get 'friendship_requests/destroy'
  root :to => 'static_pages#home'
  devise_for :users   #sorts out authentication routing
  as :user do
    get  'signin', to: 'devise/sessions#new'
    post 'signin', to: 'devise/sessions#create'
    get  'signup', to: 'devise/registrations#new'
    post 'signup', to: 'devise/registrations#create'
  end
  resources :users, only: [:index]
  resources :friendship_requests,     only: [:create, :destroy]
  resources :friendships,             only: [:create, :destroy]
end
