Rails.application.routes.draw do
  root 'home#index'
  get 'home', to: 'home#index'
  
  get 'profile', to: 'profile#index'
  devise_for :users
  get 'u/:id', to: 'profile#show', as: 'user'
  get 'admin/index', to: 'admin#index'
  get 'admin', to: 'admin#index', as: 'admin'
  get 'admin/create', to: 'admin#create', as: 'admin_create'
  get 'admin/console', to: 'admin#console'
  
  get 'home/about'
  get 'home/print'
  get 'home/crotchet'
  get 'home/embroidery'
  get 'home/social'
  get 'home/contact'
  get 'home/credit'
  match '/' => 'errors#not_found', via: :all
  
  # resources :crafts do
  #   resources :comments
  # end
  
  resources :crafts, only: [:index, :show, :edit, :create] do
    resources :comments
  end
  
end