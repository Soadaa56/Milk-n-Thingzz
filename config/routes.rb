Rails.application.routes.draw do
  # get 'home/index'
  root 'home#index'
  get 'home/about'
  get 'home/3dprint'
  get 'home/crotchet'
  get 'home/embroidery'
  get 'home/social'
  get 'home/contact'
  get 'home/credit'
end
