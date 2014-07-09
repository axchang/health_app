class RequestsController < ApplicationController
	before_action :set_requests, :only => [:show, :edit, :destroy]
	before_action :create_needs_hash, :only => [:index, :show, :update]
	before_action :set_need_types, :only => [:new, :update, :show]
	before_action :authenticate_user!, only: [:edit, :update, :destroy]   

	def index
		if params[:status] == "met"
			@requests = Request.where(:status => "met")
		else
			@requests = Request.where(:status => nil)
		end	
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
			set_need_types
			render :new
		end
	end

	def community_create
		@request = Request.new(request_params.merge({:user_id => 1}))
	end

	def meet
		@request = Request.find(params[:request_id])
	end

	def update
		@request = Request.find(params[:request_id])
		@request.status = "met"
		@request.save
		UserMailer.message_out_email(current_user, params[:message], @request.user.email).deliver
		@requests = Request.where(:status => "met")
		if params[:status] == "met"
			redirect_to "/requests?status=met"
		else
			redirect_to requests_path
		end
	end

	def destroy
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
