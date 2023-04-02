class AddExpMonthYear < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :exp_month, :integer
    add_column :cards, :exp_year, :integer
  end
end
