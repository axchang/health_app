class TwilioController < ApplicationController

  # def process_sms
   
  #   @request = Request.create(description: params[:Body], user_id: 1)
  #   #how do we set a user - can we seed this?

  #   #render 'process_sms.xml.erb', :content_type => 'text/xml'
  # end

	def process_sms
	  session["counter"] ||= 0
	  sms_count = session["counter"]
		  if sms_count == 0
		    message = "Thanks for contacting Insight Health! What kind of request are you making? Reply with 1 for Medication, 2 for Vaccination, 3 for Other."
		  else sms_count == 1
		    @request = Request.create(user_id: 1, need_id: params[:Body])
		    message = "Got it! You can reply with a description, otherwise we'll post your request now!"
		  end
	  twiml = Twilio::TwiML::Response.new do |r|
	    r.Sms message
	  end
	  session["counter"] += 1
	  twiml.text
	end

end