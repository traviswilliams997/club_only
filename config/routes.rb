Rails.application.routes.draw do
  devise_for :users 


    resources :posts, only: [:index, :new, :create] 
  


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defindexines the root path route ("/")
   root "users#index"
end
