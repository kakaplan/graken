class UpdateLatLongDatatype < ActiveRecord::Migration[7.0]
  def change
    change_column :stations, :longitude, :decimal, :precision=>9, :scale=>7
    change_column :stations, :latitude, :decimal, :precision=>9, :scale=>7
  end
end
