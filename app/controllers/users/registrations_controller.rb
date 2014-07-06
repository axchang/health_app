class Users::RegistrationsController < Devise::RegistrationsController

def new
	@locations = Location.all.pluck(:local_muni)
	@specialties = Specialty.all.pluck(:service_type)
	super
end

def edit
	@locations = Location.all.pluck(:local_muni)
	@specialties = Specialty.all.pluck(:service_type)
	super
end			

end