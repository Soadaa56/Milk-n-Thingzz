Rails.application.routes.draw do

  root 'home#index'
  get 'home', to: 'home#index'

  devise_for :users

  get 'profile', to: 'profile#index'
  get 'profile/:id/edit', to: 'profile#edit', as: :profile_edit
  patch 'profile/:id', to: 'profile#update', as: :profile_update
  get 'admin', to: 'admin#index', as: 'admin'
  get 'admin/index', to: 'admin#index'

  get 'home/store'
  get 'home/about'
  get 'home/social'
  get 'home/contact'
  get 'home/credit'
  # craft categories sorted - alphabetized
  get 'home/crochet'
  get 'home/earring'
  get 'home/embroidery'
  get 'home/miscellaneous'
  get 'home/necklace'
  get 'home/painting'
  get 'home/print'

  get 'checkout', to: 'checkout#show'

  resources :crafts, only: [:index, :show, :edit, :new, :create, :update, :destroy] do
    collection do
      get :new_with_variants
      post :create_with_variants
    end

    member do
      patch :move_image
    end
    
    resources :variants, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resource  :cart, only: [:show] do
    resources :cart_items, only: [:create, :update, :destroy]
  end

  # Health check routes for kamal
  get '/up', to: 'health#up'
  get '/health', to: 'health#up', as: :rails_health_check

  match '/' => 'errors#not_found', via: :all
end
