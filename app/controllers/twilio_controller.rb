class TwilioController < ApplicationController

  def process_sms
    @city = params[:FromCity].capitalize
    @state = params[:FromState]
    @request = Request.create(description: params[:Body], user_id: 1)
    #how do we set a user - can we seed this?

    #render 'process_sms.xml.erb', :content_type => 'text/xml'
  end

end