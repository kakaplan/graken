class Station < ApplicationRecord
  enum status: [ :closed, :open ]
  validates_presence_of    :identifier,
                           :name,
                           :address,
                           :count,
                           :status
  validates_uniqueness_of  :identifier
  
  has_many :docked_bikes, class_name: :Bike, foreign_key: :current_station_id
  
end
