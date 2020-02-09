Rails.application.routes.draw do

  root :to => 'static_pages#home'
  devise_for :users   #sorts out authentication routing

  as :user do
    get  'signin', to: 'devise/sessions#new'
    post 'signin', to: 'devise/sessions#create'
    get  'signup', to: 'devise/registrations#new'
    post 'signup', to: 'devise/registrations#create'
  end
  
  resources :users, only: [:index, :show]
  resources :friendship_requests,     only: [:index, :create, :destroy]
  resources :friendships,             only: [:create, :destroy]
  resources :posts
end
