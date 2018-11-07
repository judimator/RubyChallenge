require 'rails_helper'

RSpec.describe 'Test StockController', type: :feature do
  let(:current_user) { create(:user) }
  let!(:stock) { create(:stock, user: current_user) }

  it 'returns a list of stocks' do
    visit '/login'
    within('#new_user') do
      fill_in 'user_email', with: 'test@test.test'
      fill_in 'user_password', with: 'testtest'
    end
    click_button 'Sign in'
    expect(page).to have_content('Stock name')
  end


  it 'returns a particular stock' do
    visit '/login'
    within('#new_user') do
      fill_in 'user_email', with: 'test@test.test'
      fill_in 'user_password', with: 'testtest'
    end
    click_button 'Sign in'

    visit '/stock/' + stock.id.to_s
    expect(page).to have_no_content(:all, 'Not found')
  end

  it 'returns a particular stock' do
    visit '/login'
    within('#new_user') do
      fill_in 'user_email', with: 'test@test.test'
      fill_in 'user_password', with: 'testtest'
    end
    click_button 'Sign in'

    visit '/stock/new'
    within('#new_stock') do
      fill_in 'stock_name', with: 'Another stock name'
      fill_in 'stock_unit_price', with: 10
      fill_in 'stock_duration', with: 5
      fill_in 'stock_interest', with: 10
    end
    click_button 'Create'

    expect(page).to have_content('Another stock name')
  end

  it 'returns "Not found" for stock that don\' belong ot user' do
    create(:user, email: 'test@test.test2')

    visit '/login'
    within('#new_user') do
      fill_in 'user_email', with: 'test@test.test2'
      fill_in 'user_password', with: 'testtest'
    end
    click_button 'Sign in'

    visit '/stock/' + stock.id.to_s
    expect(page).to have_content(:all, 'Not found')
  end
end