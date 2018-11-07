require 'rails_helper'

RSpec.describe Stock, type: :model do

  let!(:current_user) { create(:user) }

  it 'is a valid' do
    stock = Stock.new({name: 'Stock name', unit_price: 100, interest: 5, duration: 5, user: current_user})
    expect(stock).to be_valid
  end

  it 'is stock with invalid name' do
    stock = Stock.new({name: nil, unit_price: 100, interest: 5, duration: 5, user: current_user})
    expect(stock).to_not be_valid
  end

  it 'is stock with invalid unit_price' do
    stock = Stock.new({name: 'Stock name', unit_price: nil, interest: 5, duration: 10, user: current_user})
    expect(stock).to_not be_valid
  end

  it 'is stock with invalid interest' do
    stock = Stock.new({name: 'Stock name', unit_price: 100, interest: nil, duration: 5, user: current_user})
    expect(stock).to_not be_valid
  end

  it 'is stock with invalid diration' do
    stock = Stock.new({name: 'Stock name', unit_price: 100, interest: 5, duration: nil, user: current_user})
    expect(stock).to_not be_valid
  end

  it 'is stock with invalid user' do
    stock = Stock.new({name: 'Stock name', unit_price: 100, interest: 5, duration: 5, user: nil})
    expect(stock).to_not be_valid
  end
end

