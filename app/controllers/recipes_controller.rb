class RecipesController < ApplicationController
  before_action :recipe_params, only: :create
  def new
    @recipe = Recipe.new
  end

  def create
    @user = current_user
    @recipe = @user.recipes.new(@recipe_params)
    if @recipe.save
      redirect_to user_recipes_path, notice: 'recipe was successfully created'
    else
      render :new, alert: "Couldn't create recipe for user"
    end
  end

  def index
    @user = current_user
    @recipes = Recipe.all
  end

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @foods = Food.all
    @recipe_foods = @recipe.recipe_foods.includes(:food, :recipe).order(:id)
  end

  def destroy
    @user = current_user
    @recipe = @user.recipes.find(params[:id])
    @recipe.destroy!
    redirect_to user_recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
