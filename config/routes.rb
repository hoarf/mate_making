MateMaking::Application.routes.draw do

	devise_for :users
  
  put '/users/mate' , :to => 'users#find_mate' , :as => 'edit_user_mate'
  
  resources :users
  
  resources :mateships
  
  root :to => "static_pages#home"

end
