class Request < ActiveRecord::Base
	belongs_to :need
	belongs_to :user

	#Call back to trigger email send after the request is actually created
	after_create :send_request_posted_email
	# Validate that certain parameters exist before the email is sent--DOUBLE CHECK
	# validates 

	protected

	def send_request_posted_email
		#Gets the need_id corresponding to the request that was just created
	    iteration_id = self.need_id
	    #Creates an array of all of the users with the given optin
	    recipients = Need.find(iteration_id).users
	    #Creates an array of all of the emails of the users with the given optin
	    to_email = recipients.pluck(:email)
	    #Actually delivers to each of the emails in the array
	    to_email.each do |email|
			UserMailer.request_posted_email(self, email).deliver
		end
	end
end