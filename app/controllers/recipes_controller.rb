class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  # POST /recipes or /recipes.json
  def create
    @user = current_user
    @recipe = @user.recipes.new(recipes_params)
    if @recipe.save
      redirect_to recipes_path, notice: 'recipe was successfully created'
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
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.permit(:name, :description, current_user.id)
  end
end
