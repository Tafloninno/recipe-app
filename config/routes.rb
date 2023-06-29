Rails.application.routes.draw do
  devise_for :users
 root 'public_recipes#index'
 
   resources :recipes, only: [:index, :new, :show, :create, :destroy] do
     resources :recipe_foods, except: :update
   end
 
   
 
   resources :foods, only: [:index, :show, :create, :new, :destroy] 
   resources :shopping_lists, only: [:index]
 end
