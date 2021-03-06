Rails.application.routes.draw do

  root :to => 'static_pages#home'
  get '/privacy_policy', to: 'static_pages#privacy_policy'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }  
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  as :user do
    get  'signin', to: 'devise/sessions#new'
    post 'signin', to: 'devise/sessions#create'
    get  'signup', to: 'devise/registrations#new'
    post 'signup', to: 'devise/registrations#create'
  end
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :friendship_requests,     only: [:index, :create, :destroy]
  resources :friendships,             only: [:create, :destroy]
  resources :posts do
    resources :comments,              only: [:create, :destroy]
    resources :likes,                 only: [:create, :destroy]
  end
end
