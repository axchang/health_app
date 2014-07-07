class MessagesController < ApplicationController
	def new
		@request = Request.find(params[:request_id])
	end

	def confirmation
		@request = Request.find(params[:request_id])
		@message_body = params[:message]
		UserMailer.message_out_email(@message_body, @request.user.email).deliver
	end
end