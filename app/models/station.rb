class Station < ApplicationRecord
  enum status: [ :closed, :open ]
  validates_presence_of    :identifier,
                           :name,
                           :address,
                           :status,
                           :longitude,
                           :latitude
  validates_uniqueness_of  :identifier
  validates_numericality_of :identifier, :longitude, :latitude
  
  has_many :docked_bikes, class_name: :Bike, primary_key: :identifier, foreign_key: :current_station_id
  
end
