# frozen_string_literal: true

class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :name
      t.decimal :unit_price, precision: 10, scale: 2
      t.text :interest
      t.integer :duration

      t.timestamps
    end
  end
end
