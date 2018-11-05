class StockController < ApplicationController
  before_action :authenticate_user!

  def index
    @stocks = Stock.all.order(created_at: :asc)
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def create
    @stock = Stock.new
    if @stock.save
      flash[:success] = "Stock was added successfully!"
      redirect_to stock_index_path
    else
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