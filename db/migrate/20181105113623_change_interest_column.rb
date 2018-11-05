class ChangeInterestColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :stocks, :interest, :string
    add_column :stocks, :interest, :decimal, precision: 10, scale: 2
  end
end
