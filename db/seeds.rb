# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# user1 = User.new(discipline: "Research", institute_centre_type: 'RARS', institute_centre_name: 'Rajendranagar',location: "Rajendranagar", address: "500030", mobile_number: "9014488000", type: "Institute", name: "Institute", email: "institute@demo.com", password: "000000", pwd: "000000")
# user1.save(validate: false)
User.destroy_all
UploadFile.destroy_all

p "Destroyed all data"
p "seed started..."
user2 = User.new(type: "ElectronicWing", name: "electronic_wing", email: "electronic_wing@demo.com", password: "password@ew", pwd: "password@ew")
user2.save(validate: false)
# user3 = User.new(discipline: "Teaching", institute_centre_type: 'UG/PG Colleges', institute_centre_name: 'Palem',location: "Palem", address: "500030", mobile_number: "9014488000", type: "Institute", name: "Teaching", email: "teaching@demo.com", password: "000000", pwd: "000000")
# user3.save(validate: false)

require 'csv'

file = "#{Rails.root}/public/import_institutes.csv"
csv_text = File.read(file)
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  p row.to_hash[:type] = "Institute"
  p row
  user = Institute.new(row.to_hash)
  user.save
end

p "completed"
