class Rental < ApplicationRecord
    validates_presence_of  :identifier,
                           :start_time,
                           :end_time,
                           :distance_traveled,
                           :start_station_id,
                           :end_station_id,
                           :bike_id,
                           :user_id,
                           :card_id

    belongs_to :bike_rented, class_name: :Bike, primary_key: :identifier, foreign_key: :bike_id
    belongs_to :user_rented, class_name: :User, primary_key: :id, foreign_key: :user_id
    belongs_to :card_rented, class_name: :Card, primary_key: :id, foreign_key: :card_id
    belongs_to :start_station, class_name: :Station, primary_key: :identifier, foreign_key: :start_station_id
    belongs_to :end_station, class_name: :Station, primary_key: :identifier, foreign_key: :end_station_id
end

