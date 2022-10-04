Rails.application.routes.draw do
  
  resources :recipes
  
  devise_for :users
  root 'users#index'
  resources :users do
    resources :foods
    resources :recipes do
      resources :recipe_foods
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
