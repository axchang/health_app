class Request < ActiveRecord::Base
	has_one :need
	belongs_to :user
end