class AddStatusToRental < ActiveRecord::Migration[7.0]
  def change
    add_column :rentals, :status, :integer, default: 1, null: false
  end
end
