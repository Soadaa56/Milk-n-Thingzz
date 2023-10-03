Rails.application.routes.draw do
  root 'home#index'
  get 'home', to: 'home#index'

  get 'profile', to: 'profile#index'
  devise_for :users
  get 'u/:id', to: 'profile#show', as: 'user'
  
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
  
  resources :crafts, only: [:index, :show] do
    resources :comments
  end
  
end