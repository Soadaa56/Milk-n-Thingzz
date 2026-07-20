Rails.application.routes.draw do
  root 'home#index'
  get 'home', to: 'home#index'

  devise_for :users

  get 'profile', to: 'profile#index'
  get 'profile/:id/edit', to: 'profile#edit', as: :profile_edit
  patch 'profile/:id', to: 'profile#update', as: :profile_update
  get 'admin', to: 'admin#index', as: 'admin'
  get 'admin/index', to: 'admin#index'

  get 'home/about'
  get 'home/print'
  get 'home/crotchet'
  get 'home/embroidery'
  get 'home/earring'
  get 'home/necklace'
  get 'home/painting'
  get 'home/miscellaneous'
  get 'home/social'
  get 'home/contact'
  get 'home/credit'

  match '/' => 'errors#not_found', via: :all

  resources :crafts, only: [:index, :show, :edit, :new, :create, :update, :destroy] do
    member do
      patch :move_image
    end
  end

  # Health check routes for kamal
  get '/up', to: 'health#up'
  get '/health', to: 'health#up', as: :rails_health_check
end
