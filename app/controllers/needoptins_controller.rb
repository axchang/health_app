class NeedOptInsController < ApplicationController
before_action :set_needoptins, :only => [:show, :edit, :destroy]
	# added by MPC - Amy please specify which actions under requests you would like to require authentication
	before_action :authenticate_user!

	def index
		@needoptins = NeedOptIn.all
	end

	def new
		@needoptin = NeedOptIn.new
		set_need_types
	end

	def edit
		set_need_types
	end

	def show
		create_needs_hash
	end

	def create
		@needoptin = NeedOptIn.new(needoptin_params)
		if @needoptin.save
			redirect_to needoptins_path
			flash[:notice] = "Notification was successfully set-up! We'll be email you as soon as a new need is requested!"
		else
			flash[:notice] = "Sorry, the action could not be completed. Please try again."
			set_need_types
			render :new
		end
	end

	def destroy
		@needoptin.destroy

		redirect_to needoptins_path
	end

	def update
		#needs more code here
		set_need_types
	end

	private

	def set_needoptins
		@needoptin = NeedOptIn.find(params[:id])
	end

	def needoptin_params
		params.require(:needoptin).permit(:user_id, :need_id)
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


end