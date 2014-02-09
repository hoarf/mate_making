MateMaking::Application.routes.draw do

  get "tags/index"

  devise_for :users
  
  put '/users/mate' , :to => 'users#find_mate' , :as => 'edit_user_mate'
  
  resources :users
  
  resources :tags

  resources :mateships
  
  root :to => "static_pages#home"

end
