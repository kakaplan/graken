class Bike < ApplicationRecord
  validates_presence_of    :identifier,
                           :current_station_id
  validates_uniqueness_of  :identifier
  validates_numericality_of :identifier, :current_station_id

  belongs_to :current_station, class_name: :Station, foreign_key: :current_station_id, optional: true
  
  validate :current_station_exists
  
  private

  def current_station_exists
    return if Station.where(identifier: current_station_id).any?
    errors.add(:current_station_id, "Station Identifier must belong to an existing station.")
  end
end
