# frozen_string_literal: true

class StockController < ApplicationController
  before_action :authenticate_user!

  def index
    @stocks = current_user.stocks.order(created_at: :asc)
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def create
    @stock = current_user.stocks.new(stock_params)

    if @stock.save
      flash[:success] = 'Stock was added successfully!'
      redirect_to stock_index_path
    else
      flash[:error] = 'An occurred error. Please, contact your administrator.'
      render :new
    end
  end

  def new
    @stock = Stock.new
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :unit_price, :interest, :duration)
  end
end
