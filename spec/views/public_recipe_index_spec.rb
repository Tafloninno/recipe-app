require 'rails_helper'

RSpec.describe 'Recipe index', type: :feature do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Mugisha', email: 'mugisha@mail.com', password: 123_456)
    sign_in @user
    @recipe = Recipe.create(user: @user, name: 'Rice', preparation_time: 2, cooking_time: 1,
                            description: 'use water', public: true)
    visit root_path
  end

  it 'Displays the heading' do
    expect(page).to have_content('Public Recipes')
  end

  it 'Displays the Recipe Name' do
    expect(page).to have_content('Rice')
  end

  it 'Displays the Total Products' do
    expect(page).to have_content('Total')
  end

  it 'Displays the navbar content' do
    expect(page).to have_content('Home')
  end
end
