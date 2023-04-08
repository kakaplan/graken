namespace :import_bikes do

  desc "Import bikes from csv file"
  task bikes: :environment do
    require "csv"

    
    csv_text = File.read(Rails.root.join("notes", "bike-data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      b = Bike.new
      b.identifier = row["identifier"]
      b.current_station_id = row["current_station_identifier"]
      b.status = row["status"]
      b.battery = row["battery"]
      b.mileage = row["mileage"]
      b.theme_name = row["theme_name"]
      b.save
    end
  end

end
