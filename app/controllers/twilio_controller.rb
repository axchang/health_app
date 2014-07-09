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
			render 'first_message.xml.erb', :content_type => 'text/xml'	    
		  elsif sms_count == 1
		    @request = Request.create(user_id: 1, need_id: params[:Body])
		    render 'second_message.xml.erb', :content_type => 'text/xml'
		   else
		   	#this may not be ideal if someone adds a request on the web during the SMS interaction
		   	@request.update(description: params[:Body])
		    render 'third_message.xml.erb', :content_type => 'text/xml'
		    session["counter"] = -1
		  end
	  session["counter"] += 1
	  #twiml.text
	end

end