require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.new(name: 'Tom', email: 'tom@example.com', password: '123456')
    @food = @user.foods.new(name: 'cheese', measurement_unit: 'grams', price: 10, quantity: 10)
  end

  it 'food name' do
    expect(@food.name).to eq('cheese')
  end

  it 'food measurement unit' do
    expect(@food.measurement_unit).to eq('grams')
  end

  it 'food price' do
    expect(@food.price).to eq(10)
  end

  it 'food quantity' do
    expect(@food.quantity).to eq(10)
  end
end
