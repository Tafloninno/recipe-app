require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.new(name: 'Mugisha', email: 'mugisha@example.com', password: '123456')
    @recipe = @user.recipes.new(name: 'Rice', preparation_time: 1, cooking_time: 1, description: 'Rice', public: true)
    @food = @user.foods.new(name: 'spice', measurement_unit: 'grams', price: 10, quantity: 10)
    @recipe_food = @recipe.recipe_foods.new(quantity: 2, food_id: @food.id)
    @recipe_food.food = @food
  end

  it 'should have the correct food' do
    expect(@recipe_food.food).to be @food
  end

  it 'should have the correct recipe' do
    expect(@recipe_food.recipe).to be @recipe
  end

  it 'should have the correct quantity' do
    expect(@recipe_food.quantity).to be 2
  end
end
