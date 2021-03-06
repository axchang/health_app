class RequestsController < ApplicationController
	before_action :set_requests, :only => [:show, :edit, :destroy]
	before_action :create_needs_hash, :only => [:index, :show, :update]
	before_action :set_need_types, :only => [:new, :update, :show]
	#before_action :authenticate_user!, except: [:index, :new]  

	def index
		@request = Request.new
		set_need_types
		@counts = Request.where('status is NOT NULL').group(:fulfiller).count.to_a
		if params[:status] == "met"
			@requests = Request.where(:status => "met")
			@status = params[:status]
			@requests = @requests.order("updated_at DESC")
		else
			@requests = Request.where(:status => nil)
			@requests = @requests.order("created_at DESC")
		end	

	end

	def new
		@request = Request.new
	end

	def show
	end


	def create
		if user_signed_in?
			@request = Request.new(request_params.merge({:user_id => current_user.id}))
			if @request.save	
				flash[:notice] = "Request was successfully placed."
				redirect_to '/requests'
			else
				flash[:notice] = "Sorry, the action could not be completed. Please try again."
				set_need_types
				render :new
			end
		else
			@request = Request.new(request_params.merge({:user_id => 16}))
			if @request.save	
				flash[:notice] = "Request was successfully placed."
				redirect_to '/requests'
			else
				flash[:notice] = "Sorry, the action could not be completed. Please try again."
				set_need_types
				render :new
			end
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
		@request.fulfiller = "#{current_user.username}"
		@request.save
		UserMailer.message_out_email(current_user, params[:message], @request).deliver
		@requests = Request.where(:status => "met")
		if params[:status] == "met"
			flash[:notice] = "Thank you for taking the effort to meet a request!"
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
