# frozen_string_literal: true

require 'test_helper'

class StockControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    post login_url, params: { user: { name: 'test@test.test', password: 'testtest' } }
    get stock_index_url
    assert_response :success
  end

  test 'should get show' do
    get stock_url(Stock.first)
    assert_response :success
  end

  test 'should get create' do
    post stock_index_url, params: { stock: { name: 'StockName', unit_price: 100.00, duration: 2, interest: 0.2 } }
    assert_response :redirect
  end
end
