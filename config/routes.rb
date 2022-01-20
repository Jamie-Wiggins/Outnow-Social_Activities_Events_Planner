Rails.application.routes.draw do
  #mount ActionCable.server => '/cable'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :posts, only: [:new, :create]
  resources :activities, only: [:show, :edit, :update, :index, :new, :create, :destroy]
  
  resources :chatrooms, only: [:index, :show, :destory] do
    resources :reports, only: [:new, :create]
    resources :ratings, only: [:new, :create]
    resource :chatroom_users, only: [:create, :destroy]
    resources :messages, only: [:create]
  end
  
  root 'pages#home'
  get '/user/:id' => 'pages#profile'
  get 'contact', to: 'pages#contact_us'
  post 'request_contact', to: 'pages#request_contact'
  get 'index', to: 'pages#activity_index'
  get 'legal', to: 'pages#legal'
  get 'about', to:'pages#about_us'
  patch 'change_avatar', to: 'pages#change_avatar'
end