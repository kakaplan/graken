class AddDetailsToBikes < ActiveRecord::Migration[7.0]
  def change
    add_column :bikes, :status, :string
    add_column :bikes, :battery, :float
    add_column :bikes, :mileage, :float
  end
end
