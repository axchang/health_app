class TwilioController < ApplicationController

  # def process_sms
   
  #   @request = Request.create(description: params[:Body], user_id: 1)
  #   #how do we set a user - can we seed this?

  #   #render 'process_sms.xml.erb', :content_type => 'text/xml'
  # end

	def process_sms
	  session["counter"] = session["counter"] || 0
	  
		  if session["counter"] == 0
			render 'first_message.xml.erb', :content_type => 'text/xml'	    
		  elsif session["counter"] == 1   
		  	render 'second_message.xml.erb', :content_type => 'text/xml'
		  	@request = Request.create(need_id: params[:Body], user_id: 5)
		  elsif session["counter"] == 2
		  # #this may not be ideal if someone adds a request on the web during the SMS interaction
		  	render 'third_message.xml.erb', :content_type => 'text/xml'#    
		  	Request.last.update(description: params[:Body])   
		  	session["counter"] = -1
		   else
		   	render 'error_message.xml.erb', :content_type => 'text/xml'
		   	session["counter"] = -1
		   end
	  session["counter"] += 1
	  #twiml.text
	end

end