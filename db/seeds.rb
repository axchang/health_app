# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# MPC added - Default specialty values (to be modified)

["Pediatrics", "Oncology", "etc."].each do |service_type|
	Specialty.create(:service_type => service_type)
end	

["Medication", "Vaccination", "Staff"].each do |need_type|
	Need.create(:need_type => need_type)
end	