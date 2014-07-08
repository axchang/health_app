class MessagesController < ApplicationController
	def new
		@request = Request.find(params[:request_id])
	end

	def confirmation
		# @request = Request.find(params[:request_id])
		# UserMailer.message_out_email(current_user, params[:message], @request.user.email).deliver

	end

end