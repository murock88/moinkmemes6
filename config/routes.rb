Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' } #this is goddmaned important for profile pics using devise!
  resources :memes
  resources :profiles

   root 'memes#index'
  

end
