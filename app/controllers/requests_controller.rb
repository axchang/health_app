class RequestsController < ApplicationController
	before_action :set_requests, :only => [:show, :edit, :destroy]
	# added by MPC - Amy please specify which actions under requests you would like to require authentication
	before_action :authenticate_user!

	def index
		@requests = Request.all
	end

	def new
		@request = Request.new
	end

	def show
	end

	def create

		@request = Request.new(request_params.merge({:user_id => current_user.id}))
		if @request.save	
			flash[:notice] = "Request was successfully placed."
			redirect_to '/requests'
		else
			flash[:notice] = "Sorry, the action could not be completed. Please try again."
			render :new
		end
	end

	def destroy
		@request.destroy

		redirect_to requests_path
	end

	def update
		#needs more code here
	end

	private

	def set_requests
		@request = Request.find(params[:id])
	end

	def request_params
		params.require(:request).permit(:description, :user, :username, :need_id)
	end

end


