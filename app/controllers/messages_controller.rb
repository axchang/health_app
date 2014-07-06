class MessagesController < ApplicationController
	def new
		@request = Request.find(params[:request_id])
	end
end