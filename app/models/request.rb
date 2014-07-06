class Request < ActiveRecord::Base
	belongs_to :need
	belongs_to :user

	#Call back to trigger email send after the request is actually created
	after_create :send_request_posted_email
	# Validate that certain parameters exist before the email is sent--DOUBLE CHECK
	# validates 

	protected

	def send_request_posted_email
		UserMailer.request_posted_email(self).deliver
	end
	
end