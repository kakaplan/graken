class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.time :start_time
      t.time :end_time
      t.integer :start_station_id
      t.integer :end_station_id
      t.integer :distance_traveled
      t.integer :bike_id
      t.integer :user_id
      t.integer :card_id

      t.timestamps
    end
  end
end
