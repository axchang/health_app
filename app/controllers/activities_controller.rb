class ActivitiesController < ApplicationController
	def index
		@meets = Meets.all
	end
end