namespace :import_stations do

  desc "Import stations from csv file"
  task stations: :environment do
    require "csv"

    
    csv_text = File.read(Rails.root.join("notes", "station-data.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      s = Station.new
      s.identifier = row["identifier"]
      s.name = row["name"]
      s.address = row["address"]
      s.longitude = row["longitude"]
      s.latitude = row["latitude"]
      s.theme_name = row["theme_name"]
      s.save
    end

  end

end
