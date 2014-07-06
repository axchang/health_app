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

[
"Cape Town (City of)",
"Beaufort West, Central Karoo",
"Bergrivier, West Coast",
"Bitou, Eden",
"Breede Valley, Cape Winelands",
"Cape Agulhas, Overberg",
"Cederberg, West Coast",
"Drakenstein, Cape Winelands",
"George, Eden",
"Hessequa, Eden",
"Kannaland, Eden",
"Knysna, Eden",
"Laingsburg, Central Karoo",
"Langeberg, Cape Winelands",
"Matzikama, West Coast",
"Mossel Bay, Eden",
"Oudtshoorn, Eden",
"Overstrand, Overberg",
"Prince Albert, Central Karoo",
"Saldanha Bay, West Coast",
"Stellenbosch, Cape Winelands",
"Swartland, West Coast",
"Swellendam, Overberg",
"Theewaterskloof, Overberg",
"Witzenberg, Cape Winelands"
].each do |local_muni|
	Location.create(:local_muni => local_muni)
end	