class ShoppingListsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def index
    @current_user = current_user
    @foods = current_user.recipes.includes!(:foods).map(&:foods).flatten.uniq
    @total_price = @foods.map { |ingredient| ingredient.price * ingredient.total_quantity_recipes }.sum
  end
end
