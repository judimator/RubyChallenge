# frozen_string_literal: true

class AddUserForeignKeyToStock < ActiveRecord::Migration[5.2]
  def change
    add_reference :stocks, :user, foreign_key: true, index: true
  end
end
