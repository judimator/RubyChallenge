# frozen_string_literal: true

class Stock < ApplicationRecord
  validates :name, :unit_price, :duration, :interest, presence: true
  validates :duration, numericality: { only_integer: true }
  validates :unit_price, format: { with: /\A[0-9]+(\.[0-9]{1,2})?\z/, message: 'Invalid format' }
  validates :interest, format: { with: /\A[0-9]+(\.[0-9]{1,2})?\z/, message: 'Invalid format' }

  belongs_to :user

  def stock_valuation
    duration = self.duration
    interest = self.interest
    unit_price = self.unit_price
    current_unit_price = unit_price
    data = [[0, current_unit_price]]

    duration.times do |i|
      current_unit_price = + (unit_price * interest / 100)
      data << [i + 1, current_unit_price]
    end

    data
  end
end
