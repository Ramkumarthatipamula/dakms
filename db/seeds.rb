# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.new(discipline: "Research", institute_centre_type: 'RARS', institute_centre_name: 'Rajendranagar',location: "Rajendranagar", address: "500030", mobile_number: "9014488000", type: "Institute", name: "Institute", email: "institute@demo.com", password: "000000")
user1.save(validate: false)
user2 = User.new(type: "ElectronicWing", name: "Electronic Wing", email: "electronic_wing@demo.com", password: "000000")
user2.save(validate: false)
user3 = User.new(discipline: "Teaching", institute_centre_type: 'UG/PG Colleges', institute_centre_name: 'Palem',location: "Palem", address: "500030", mobile_number: "9014488000", type: "Institute", name: "Teaching", email: "teaching@demo.com", password: "000000")
user3.save(validate: false)
p "completed"
