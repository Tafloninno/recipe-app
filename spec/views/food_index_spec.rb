require 'rails_helper'

RSpec.describe 'Foods', type: :feature do
  include Devise::Test::IntegrationHelpers

  describe 'index' do
    before(:each) do
      @user = User.create(name: 'mugisha', email: 'mugisha@gmail.com', password: 'recipe')
      sign_in @user
      @food = Food.create(user: @user, name: 'Apple', measurement_unit: 'kg', quantity: 1, price: 100)
      visit foods_path
    end

    it 'renders the name of the food' do
      expect(page).to have_content(@food.name)
    end

    it 'renders the measurement_unit of the food' do
      expect(page).to have_content(@food.measurement_unit)
    end

    it 'renders the price of the food' do
      expect(page).to have_content('$100')
    end
  end
end
