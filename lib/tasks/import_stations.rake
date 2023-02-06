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
      s.count = row["docked_bike_count"]
      s.save
      puts "#{s.name}, #{s.count} saved"
    end
  puts "There are now #{Station.count} rows in the station table"

  end

end
