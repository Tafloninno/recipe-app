require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    @user = User.create(name: 'Faranosh', email: 'Faranosh@mail.com', password: 'password')
    Recipe.create(name: 'Recipe', description: 'This is description', public: true, preperation_time: '1 hours',
                  cooking_time: '1 days', user: @user)
  end

  before(:each) { subject.save }

  it 'should have name recipe' do
    expect(subject.name).to eql('Recipe')
  end

  it 'should have description "This is description"' do
    expect(subject.description).to eql('This is description')
  end

  it 'Should always have Measurement unit present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'should have public of true' do
    expect(subject.public).to eql(true)
  end
end