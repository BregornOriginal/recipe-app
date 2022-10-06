Rails.application.routes.draw do
  root 'public_recipes#index'
  devise_for :users
  resources :users 
  resources :foods
  resources :recipes do
    resources :recipe_foods
  end

  resources :public_recipes
  resources :shopping_lists
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
