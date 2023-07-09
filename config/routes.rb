Rails.application.routes.draw do
  root 'home#index'
  
  get 'home/about'
  get 'home/print'
  get 'home/crotchet'
  get 'home/embroidery'
  get 'home/social'
  get 'home/contact'
  get 'home/credit'
  
  get '/crafts', to: 'crafts#index'
  get 'crafts/:id', to: "crafts#show"
end