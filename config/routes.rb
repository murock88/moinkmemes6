Rails.application.routes.draw do
  devise_for :users
  resources :memes
  resources :profiles

   root 'memes#index'
  

end
