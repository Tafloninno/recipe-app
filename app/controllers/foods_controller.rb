class FoodsController < ApplicationController
  before_action :set_food, only: %i[show destroy]
  before_action :set_user, only: %i[index show create]

  def index
    # @user = User.find(params[:user_id])
    @foods = @user.foods.sort.reverse
    render :index
  end

  def new
    @food = Food.new
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @food = @user.foods.new(**food_params)
    if @food.save
      flash[:success] = 'Food saved successfully'
      redirect_to user_foods_url
    else
      flash.now[:error] = 'Error: Food could not be saved'
      render :new
    end
  end

  def destroy
    @user = current_user
    if @food.destroy
      flash[:success] = 'Food was successfully deleted.'
    else
      flash[:error] = 'Error: Food could not be deleted'
    end
    redirect_to user_foods_url
  end

  def show
    @food
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_food
    @food = set_user.foods.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
