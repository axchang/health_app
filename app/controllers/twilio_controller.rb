class TwilioController < ApplicationController

  def process_sms
    @city = params[:FromCity].capitalize
    @state = params[:FromState]
    @request = Request.create(description: params[:Body], user: "hip-hop anonymous")

    #render 'process_sms.xml.erb', :content_type => 'text/xml'
  end

end