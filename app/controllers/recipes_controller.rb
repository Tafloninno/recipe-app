class RecipesController < ApplicationController
  before_action :recipe_params, only: :create
  def new
    @recipe = Recipe.new
  end

  # POST /recipes or /recipes.json
  def create
    @user = current_user
    @recipe = @user.recipes.new(recipes_params)
    if @recipe.save
      redirect_to user_recipes_path, notice: 'recipe was successfully created'
    else
      render :new, alert: "Couldn't create recipe for user"
    end
  end

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @foods = food.all
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @user = current_user
    @recipe = @user.recipes.find(params[:id])
    @recipe.destroy!
    redirect_to user_recipes_path
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preperation_time, :cooking_time, :description, :public, :user_id)
  end
end
