class Stock < ApplicationRecord
  validates :name, :unit_price, :duration, :interest, presence: true
  validates :duration, numericality: { only_integer: true }
  validates_format_of :unit_price, :with => /\A[0-9]+(\.[0-9]{1,2})?\z/, :message => "Invalid format"
  validates_format_of :interest, :with => /\A[0-9]+(\.[0-9]{1,2})?\z/, :message => "Invalid format"

  def get_stock_valuation
    duration = self.duration
    interest = self.interest
    unit_price = self.unit_price
    current_unit_price = unit_price
    data = [[0, current_unit_price]]

    duration.times do |i|
      current_unit_price = current_unit_price + (unit_price * interest/100)
      data << [i+1, current_unit_price]
    end

    data
  end

end
