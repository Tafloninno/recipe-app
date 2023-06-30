require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    @user = User.create(name: 'Faranosh', email: 'faranosh@mail.com', password: 'password')
    Food.create(name: 'Corn', measurement_unit: 'grams', price: 2, user: @user)
  end

  before(:each) { subject.save }

  it 'should have name "Corn"' do
    expect(subject.name).to eq('Corn')
  end

  it 'should have measurement_unit "grams"' do
    expect(subject.measurement_unit).to eq('grams')
  end

  it 'should have a price of 2' do
    expect(subject.price).to eq(2)
  end
end
