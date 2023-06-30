Rails.application.routes.draw do
  devise_for :users
  root 'public_recipes#index'

  resources :recipes, only: [:index, :new, :show, :create, :destroy, :update] do
    resources :recipe_foods, except: :update
    resources :general_shopping_lists, only: [:new], as: :recipe_general_shopping_lists

    # Add the update route for the recipe's public attribute
    patch 'update_visibility', on: :member
  end

  resources :foods, only: [:index, :show, :create, :new, :destroy]
  resources :shopping_lists, only: [:index]
end
