Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  get 'home/about'
  get 'home/print'
  get 'home/crotchet'
  get 'home/embroidery'
  get 'home/social'
  get 'home/contact'
  get 'home/credit'
  match '/' => 'errors#not_found', via: :all
  
  resources :crafts do
    resources :comments
  end
  
  resources :crafts, only: [:index, :show]
end