class ShoppingListsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @current_user = current_user
    @foods = current_user.recipes.includes(foods: :recipe_foods).map(&:foods).flatten.uniq
    @total_price = calculate_total_price(@foods)
  end

  private

  def calculate_total_price(foods)
    foods.sum { |food| food.price * food.total_quantity_recipes }
  end
end
