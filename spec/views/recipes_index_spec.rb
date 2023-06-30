require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  include Devise::Test::IntegrationHelpers
  describe 'index' do
    before(:each) do
      @user = User.create(name: 'Mugisha', email: 'mugisha@mail.com', password: 123_456)
      sign_in @user
      @recipe = Recipe.create(user: @user, name: 'Rice', preparation_time: 2, cooking_time: 1,
                              description: 'use water', public: true)
      visit recipes_path
    end

    it 'renders name of recipe' do
      expect(page).to have_content(@recipe.name)
    end

    it 'renders description of the recipe' do
      expect(page).to have_content(@recipe.description)
    end

    it 'renders remove button' do
      expect(page).to have_content('remove')
    end

    it 'redirects to delete path' do
      click_button 'remove'
      expect(page).to have_current_path(recipes_path)
    end

    it 'renders a button to add recipe' do
      expect(page).to have_content('Create new recipe')
    end

    it 'redirects to a form for new recipe' do
      click_link 'Create new recipe'
      expect(page).to have_current_path(new_recipe_path)
    end
  end
end
