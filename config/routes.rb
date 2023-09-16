Rails.application.routes.draw do
  root 'home#index'

  get 'users/profile'
  devise_for :users
  get 'u/:id', to: 'users#profile', as: 'user'
  
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