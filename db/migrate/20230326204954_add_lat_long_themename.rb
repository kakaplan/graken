class AddLatLongThemename < ActiveRecord::Migration[7.0]
  def change
    add_column :stations, :longitude, :decimal, :precision=>15, :scale=>10
    add_column :stations, :latitude, :decimal, :precision=>15, :scale=>10
    add_column :stations, :theme_name, :string
   
  end
end
