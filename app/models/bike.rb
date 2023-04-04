class Bike < ApplicationRecord
  validates_presence_of    :identifier,
                           :current_station_id
  validates_uniqueness_of  :identifier
  
  belongs_to :current_station, class_name: :Station, primary_key: :identifier, foreign_key: :current_station_id, optional: true
  has_many :rental_history, class_name: :Rental, primary_key: :identifier, foreign_key: :bike_id 
end
