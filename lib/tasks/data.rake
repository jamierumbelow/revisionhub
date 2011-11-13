# desc "Imports a list of universities from a CSV file"
# task :import_universities => :environment do
#   csv = File.read "#{Rails.root}/data/universitytables.csv"
#   rows = csv.split "\n"
#   
#   rows.each do |row|
#     cells = row.split ","
#     uni = cells[1]
#     
#     University.create!(:name => uni)
#   end
# end

desc "Imports all the fucking data. May cause a boner."
task :import => :environment do
  csv = File.read "#{Rails.root}/data/uk_university_courses_from_ucas.csv"
  rows = csv.split "\n"
  rows.shift
  
  i = 1
  courses = []
  
  rows.each do |row|
    cells = row.split ","
    university = cells[0]
    course = cells[3]
    
    uni = University.find_or_create_by_name(university)
    courses << Course.new(:university_id => uni.id, :name => course)
    
    STDOUT.write "\r#{i} rows imported"
    
    i += 1
  end
  
  Course.import courses
end