desc "Imports a list of universities from a CSV file"
task :import_universities => :environment do
  csv = File.read "#{Rails.root}/data/universitytables.csv"
  rows = csv.split "\n"
  
  rows.each do |row|
    cells = row.split ","
    uni = cells[1]
    
    University.create!(:name => uni)
  end
end