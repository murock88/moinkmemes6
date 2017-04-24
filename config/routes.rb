Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' } #this is important for profile pics using devise!
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
 
  resources :memes do
    resources :comments
  end
  
  resources :profiles

   root 'memes#index'
   get  'newsfeed/home'
  

end
