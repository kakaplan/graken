class CleanupRentals < ActiveRecord::Migration[7.0]
  def change
    remove_column :rentals, :distance_traveled
    remove_column :rentals, :identifier
    remove_column :rentals, :status
  end
end
