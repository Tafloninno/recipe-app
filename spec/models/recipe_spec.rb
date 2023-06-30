require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    @user = User.create(name: 'Faranosh', email: 'faranosh@mail.com', password: 'password')
    Recipe.create(name: 'Recipe', description: 'This is description', public: true, preparation_time: 60,
                  cooking_time: 1440, user: @user)
  end

  before(:each) { subject.save }

  it 'should have name "Recipe"' do
    expect(subject.name).to eq('Recipe')
  end

  it 'should have description "This is description"' do
    expect(subject.description).to eq('This is description')
  end

  it 'should always have a description present' do
    subject.description = nil
    expect(subject).to_not be_valid
    expect(subject.errors[:description]).to include("can't be blank")
  end

  it 'should have public set to true' do
    expect(subject.public).to eq(true)
  end

  it 'should have a valid preparation time' do
    expect(subject.preparation_time).to eq(60)
  end

  it 'should have a valid cooking time' do
    expect(subject.cooking_time).to eq(1440)
  end

  it 'should always have a preparation time present' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
    expect(subject.errors[:preparation_time]).to include("can't be blank")
  end

  it 'should always have a cooking time present' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
    expect(subject.errors[:cooking_time]).to include("can't be blank")
  end

  it 'should have a preparation time greater than or equal to 0' do
    subject.preparation_time = -1
    expect(subject).to_not be_valid
    expect(subject.errors[:preparation_time]).to include('must be greater than or equal to 0')
  end

  it 'should have a cooking time greater than or equal to 0' do
    subject.cooking_time = -1
    expect(subject).to_not be_valid
    expect(subject.errors[:cooking_time]).to include('must be greater than or equal to 0')
  end
end
