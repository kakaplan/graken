class AddStatusToStations < ActiveRecord::Migration[7.0]
  def change
    add_column :stations, :status, :integer, default: 1, null: false
  end

end
