class Request < ActiveRecord::Base
	belongs_to :need
	belongs_to :user
end