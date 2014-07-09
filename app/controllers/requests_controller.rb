class RequestsController < ApplicationController
	before_action :set_requests, :only => [:show, :edit, :destroy]
	# added by MPC - Amy please specify which actions under requests you would like to require authentication
	before_action :authenticate_user!

	def index
		@requests = Request.all
		create_needs_hash
	end

	def new
		@request = Request.new
		set_need_types
	end

	def edit
		set_need_types
	end

	def show
		create_needs_hash
	end

	def create

		@request = Request.new(request_params.merge({:user_id => current_user.id}))
		if @request.save	
			flash[:notice] = "Request was successfully placed."
			redirect_to '/requests'
		else
			flash[:notice] = "Sorry, the action could not be completed. Please try again."
			set_need_types
			render :new
		end
	end

	def meet
		@request = Request.find(params[:request_id])
	end

	def update
		#needs more code here
		set_need_types
		@request = Request.find(params[:request_id])
		@request.status = "met"
		UserMailer.message_out_email(current_user, params[:message], @request.user.email).deliver
		@request = []
		@request = Request.where(:status => "met")
	end

	def destroy
		@request.destroy

		redirect_to requests_path
	end

	private

	def set_requests
		puts params
		@request = Request.find(params[:id])
	end

	def request_params
		params.require(:request).permit(:description, :need_id)
	end

	def set_need_types
		@need_types = Need.all.pluck(:need_type, :id)
	end

	def create_needs_hash
		@needs_hash = {}
		Need.all.each do |t|
			@needs_hash[t.id] = t.need_type
		end
	end

end


