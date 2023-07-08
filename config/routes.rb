Rails.application.routes.draw do
  get 'crafts/index'
  get 'crafts/show'
  # get 'home/index'
  root 'home#index'
  get 'home/about'
  get 'home/print'
  get 'home/crotchet'
  get 'home/embroidery'
  get 'home/social'
  get 'home/contact'
  get 'home/credit'
end
