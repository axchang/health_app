class NeedoptinsController < ApplicationController
	#before_action :set_user, only: [:show, :edit, :update, :destroy]
	# added by MPC - Amy please specify which actions under requests you would like to require authentication
	before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy, :new]
	
	def index
		@needoptins = Needoptin.all
		create_needs_hash
	end

	def new
		@needoptin = Needoptin.new
		set_need_types
	end

	def edit
		set_need_types
	end

	def show
		create_needs_hash
	end

	def create
		@needoptin = Needoptin.new(needoptin_params.merge({:user_id => current_user.id}))
		if @needoptin.save
			redirect_to needoptins_path
			flash[:notice] = "Notification was successfully established."
		else
			flash[:notice] = "Sorry, the action could not be completed. Please try again."
			set_need_types
			render :new
		end
	end

	def destroy
		@needoptin = Needoptin.find(params[:id])
    	@needoptin.destroy

		redirect_to needoptins_path
	end

	def update
		#needs more code here
		set_need_types
	end

	private

	def set_needoptins
		@needoptin = Needoptin.find(params[:id])
	end

	def needoptin_params
		params.require(:needoptin).permit(:need_id)
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
